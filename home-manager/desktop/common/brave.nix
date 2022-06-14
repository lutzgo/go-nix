{ config, pkgs, lib, persistence, ... }: {

home.packages = [ pkgs.brave ];

nixpkgs.config.brave.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

  # home.persistence = lib.mkIf persistence {
  #   "/persist/home/lgo".directories = [ ".config/BraveSoftware" ];
  # };
}
