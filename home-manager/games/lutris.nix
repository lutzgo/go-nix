{ pkgs, lib, persistence, ... }: {
  home.packages = [ pkgs.lutris ];

  home.persistence = lib.mkIf persistence {
    "/persist/games/lgo" = {
      allowOther = true;
      directories = [ "Games/Lutris" ".config/lutris" ".local/share/lutris" ];
    };
  };
}
