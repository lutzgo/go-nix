{ pkgs, lib, persistence, ... }: {
  home.packages = [ pkgs.polymc ];

  home.persistence = lib.mkIf persistence {
    "/persist/games/lgo".directories = [ ".local/share/polymc" ];
  };
}
