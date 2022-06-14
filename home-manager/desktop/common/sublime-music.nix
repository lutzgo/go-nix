{ pkgs, lib, persistence, ... }: {
  home.packages = [ pkgs.sublime-music ];
  home.persistence = lib.mkIf persistence {
    "/persist/home/lgo".directories = [ ".config/sublime-music" ];
  };
}
