{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ "kvm-intel" ];
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c3dbfdb2-cc7b-4d10-8aea-b7fac82f1456";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-a6af2045-788c-45ca-9066-4ac8dab2c0bb".device = "/dev/disk/by-uuid/a6af2045-788c-45ca-9066-4ac8dab2c0bb";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/EBB5-54D0";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/452e96ca-8cd5-450b-b371-260dfed1a2b6"; }
    ];

  networking.useDHCP = lib.mkDefault true;

}
