# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, ... }: {

  # imports = [
  #   inputs.hardware.nixosModules.dell-xps-15-9500-nvidia
  #   inputs.hardware.nixosModules.common-pc-laptop

  #   ./hardware-configuration.nix
  # ];

  # # This will add your inputs as registries, making operations with them (such
  # # as nix shell nixpkgs#name) consistent with your flake inputs.
  # nix.registry = lib.mapAttrs' (n: v: lib.nameValuePair n { flake = v; }) inputs;

  # # # Will activate home-manager profiles for each user upon login
  # # # This is useful when using ephemeral installations
  # # environment.loginShellInit = ''
  # #   [ -d "$HOME/.nix-profile" ] || /nix/var/nix/profiles/per-user/$USER/home-manager/activate &> /dev/null
  # # '';

  # nix = {
  #   # TODO: You can remove me if you're using NixOS 22.05+
  #   package = pkgs.nixFlakes;
  #   # Enable flakes and new 'nix' command
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  #   autoOptimiseStore = true;
  # };
  
  # nixpkgs.config.allowUnfree = true;

  # boot = {
  #   # Enable swap on luks
  #   initrd = {
  #     luks.devices."luks-e68c7c21-57e9-4c08-8cbf-a02c4ff9378a".device = "/dev/disk/by-uuid/e68c7c21-57e9-4c08-8cbf-a02c4ff9378a";
  #     luks.devices."luks-e68c7c21-57e9-4c08-8cbf-a02c4ff9378a".keyFile = "/crypto_keyfile.bin";
      
  #     secrets = {
  #       "/crypto_keyfile.bin" = null;
  #     };
  #   };
    
  #   loader = {
  #     efi = {
  #       canTouchEfiVariables = true;
  #       efiSysMountPoint = "/boot/efi";
  #     };
      
  #     systemd-boot.enable = true;
  #   };
  # };
  
  # console.keyMap = "de";
  
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    firefox
  ];
  
  # hardware.pulseaudio.enable = false;
  
  # i18n = {
  #   defaultLocale = "en_US.utf8";
  #   extraLocaleSettings = {
  #     LC_ADDRESS = "de_DE.utf8";
  #     LC_IDENTIFICATION = "de_DE.utf8";
  #     LC_MEASUREMENT = "de_DE.utf8";
  #     LC_MONETARY = "de_DE.utf8";
  #     LC_NAME = "de_DE.utf8";
  #     LC_NUMERIC = "de_DE.utf8";
  #     LC_PAPER = "de_DE.utf8";
  #     LC_TELEPHONE = "de_DE.utf8";
  #     LC_TIME = "de_DE.utf8";
  #   };
  # };
  
  # networking = {
  #   hostName = "flores";
    
  #   networkmanager.enable = true;
  # };
  
  services = {
    # pipewire = {
    #   enable = true;
    #   alsa.enable = true;
    #   alsa.support32Bit = true;
    #   pulse.enable = true;
    # };
  
    printing.enable = true;

    # tlp.enable = true;
  
    xserver = {
      enable = true;
      
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      
      layout = "de";
      xkbVariant = "";
    };
  };
  
  # sound.enable = true;
  
  # time.timeZone = "Europe/Berlin";

  # users.users = {
  #   lgo = {
  #     description = "Lutz Go";
  #     isNormalUser = true;
  #     extraGroups = [ "audio" "networkmanager" "video" "wheel" ];
      
  #     hashedPassword = "$6$sgzc.z40sm7e7Gnl$PnctvSNyRkSnbKSU8ccZX4CuOaFXY0CSVqJVygyxsQs7FFGlqRhAAWxI1YfDT1gqiYC58xH6gY8JGxw3bcXKE.";
  #   };
  # };
  
  system.stateVersion = "22.05"; # Did you read the comment?
}
