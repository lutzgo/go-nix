{ config, pkgs, lib, persistence, ... }: {

home.packages = [ pkgs.nextcloud-client ];

  # home.persistence = lib.mkIf persistence {
  #   "/persist/home/lgo".directories = [ ".config/BraveSoftware" ];
  # };
}
