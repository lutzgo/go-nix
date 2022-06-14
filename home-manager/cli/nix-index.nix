{ lib, persistence, ... }: {
  programs.nix-index.enable = true;

  home.persistence = lib.mkIf persistence {
    "/persist/home/lgo".directories = [ ".cache/nix-index" ];
  };
}
