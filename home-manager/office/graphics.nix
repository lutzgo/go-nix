{ pkgs, lib, persistence, ... }: {

home.packages = with pkgs; [
  gimp-with-plugins
  imagemagick
  inkscape-with-extensions
];

#  home.persistence = lib.mkIf persistence {
#    "/persist/home/lgo".directories = [ ".config/BraveSoftware" ];
#  };
}
