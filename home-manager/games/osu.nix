{ pkgs, persistence, lib, ... }: {
  home.packages = [ pkgs.osu-lazer ];

  home.persistence = lib.mkIf persistence {
    "/persist/games/lgo".directories = [ ".local/share/osu" ];
  };
}
