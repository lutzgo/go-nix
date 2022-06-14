# System configuration for my main desktop PC
{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.dell-xps-15-9500-nvidia
    inputs.hardware.nixosModules.common-pc-laptop

    ./hardware-configuration.nix
    ../../common/global
    # ../../common/optional/lgo-greetd.nix
     ../../common/optional/networkmanager.nix
    ../../common/optional/pipewire.nix
    ../../common/optional/podman.nix
    ../../common/optional/quietboot.nix
    ../../common/optional/steam.nix
  ];

  # This will add your inputs as registries, making operations with them (such
  # as nix shell nixpkgs#name) consistent with your flake inputs.
  nix.registry = lib.mapAttrs' (n: v: lib.nameValuePair n { flake = v; }) inputs;

  nix = {
    # TODO: You can remove me if you're using NixOS 22.05+
    package = pkgs.nixFlakes;
    # Enable flakes and new 'nix' command
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    autoOptimiseStore = true;
  };

  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_5_10;
    binfmt.emulatedSystems = [ "aarch64-linux" ];

    # Enable swap on luks
    initrd = {
      luks.devices."luks-e68c7c21-57e9-4c08-8cbf-a02c4ff9378a".device = "/dev/disk/by-uuid/e68c7c21-57e9-4c08-8cbf-a02c4ff9378a";
      luks.devices."luks-e68c7c21-57e9-4c08-8cbf-a02c4ff9378a".keyFile = "/crypto_keyfile.bin";
      
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
    };
    
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      
      systemd-boot.enable = true;
    };
  };

  hardware = {
    ckb-next.enable = true;
    #cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    enableAllFirmware = true;
    #nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    opengl = {
      enable = true;
      # extraPackages = with pkgs; [ amdvlk ];
      driSupport = true;
    };
    # openrgb.enable = true;
    # opentabletdriver.enable = true;
    video.hidpi.enable = true;
  };

  networking = {
    hostName = "flores";
  };  

  programs = {
    adb.enable = true;
    dconf.enable = true;
    gamemode = {
      enable = true;
      settings.gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        # gpu_device = 0;
        # amd_performance_level = "high";
      };
    };
    kdeconnect.enable = true;
    light.enable = true;
  };

  powerManagement = {
    cpuFreqGovernor = "powersave";
    powertop.enable = true;
  };

  services = {
    dbus.packages = [ pkgs.gcr ];
    # Lid settings
    logind = {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "suspend";
    };
    tlp.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
  };

  xdg.portal = {
    enable = true;
    gtkUsePortal = true;
    wlr.enable = true;
  };

  xserver = {
      enable = true;
      
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      
      layout = "de";
      xkbVariant = "";
    };

  system.stateVersion = "22.05";
}
