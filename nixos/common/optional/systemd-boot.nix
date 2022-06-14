{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    initrd.supportedFilesystems = [ "btrfs" ];
  };
}
