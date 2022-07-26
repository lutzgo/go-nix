{ inputs, lib, games, config, rgb, pkgs, persistence, desktop, trusted, ... }:

# let inherit (lib) optional mkIf;
# in
{
  imports =
    [
      ./cli
      # ./rice
      ./office/default.nix
      ./desktop/gnome/default.nix
      ./yubikey.nix
      # inputs.impermanence.nixosModules.home-manager.impermanence
    ];
    # # Conditional imports, for different features
    # ++ optional (null != desktop) ./desktop/${desktop}
    # ++ optional games ./games
    # ++ optional trusted ./trusted
    # ++ optional rgb ./rgb;

  # https://github.com/nix-community/home-manager/issues/2942
  nixpkgs.config.allowUnfreePredicate = _: true;

  # nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  # home.persistence = mkIf persistence {
  #   "/persist/home/lgo" = {
  #     directories = [
  #       "Documents"
  #       "Downloads"
  #       "Pictures"
  #       "Videos"
  #     ];
  #     allowOther = true;
  #   };
  # };
}
