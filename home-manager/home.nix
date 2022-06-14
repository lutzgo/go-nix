# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    ./office/default.nix
    ./desktop/gnome/default.nix
  ];

  # Comment out if you wish to disable unfree packages for your system
  nixpkgs.config.allowUnfree = true;

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  
  programs = {
    ssh = {
      enable = true;
      compression = true;
      
      matchBlocks = {
        "tomala-server" = {
          hostname = "getgoto.de";
          identityFile = "~/.ssh/tomala-server-curve.pub";
          identitiesOnly = true;
          user = "tomala1";
          port = 39901;
        };
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
