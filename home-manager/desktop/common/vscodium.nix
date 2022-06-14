{ config, persistence, pkgs, lib, ... }:

let
  extensions = (with pkgs.vscode-extensions; [
      bbenoist.nix
      bungcip.better-toml
      alefragnani.project-manager
      christian-kohler.path-intellisense
      esbenp.prettier-vscode
      james-yu.latex-workshop
      jdinhlife.gruvbox
      ms-python.python
      ms-azuretools.vscode-docker
      #ms-vscode-remote.remote-containers
      ms-toolsai.jupyter
      mhutchie.git-graph
      naumovs.color-highlight
      pkief.material-icon-theme
      tabnine.tabnine-vscode
      yzhang.markdown-all-in-one
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #{
    #  name = "remote-ssh-edit";
    #  publisher = "ms-vscode-remote";
    #  version = "0.80.0";
    #  sha256 = "dab008667cd5494d49df0b0d277c16f419ea8782204a660219f9f6049268f97d";
    #}
    #{
    #  name = "remote-ssh";
    #  publisher = "ms-vscode-remote";
    #  version = "0.80.0";
    #  sha256 = "403a8a2ebe6abadc400f5456d28fd316912fd7f674c549a37fc7cfe6991b5507";
    #}
    #{
    #  name = "remote-containers";
    #  publisher = "ms-vscode-remote";
    #  version = "0.237.0";
    #  sha256 = "618e30a3941879fc64a68fcd4b8b379ce67b274c4f74ddaac74f8d29d7b8c0c8";
    #}
  ];
  vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };
in {
  home.packages = with pkgs;[
    vscodium-with-extensions
  ];

  nixpkgs.config.vscodium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

}
