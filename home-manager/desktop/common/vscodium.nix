{ config, persistence, pkgs, lib, ... }:

let
  extensions = (with pkgs.vscode-extensions; [
      alefragnani.project-manager
      bbenoist.nix
      bierner.markdown-mermaid
      bungcip.better-toml
      christian-kohler.path-intellisense
      dbaeumer.vscode-eslint
      donjayamanne.python-extension-pack
      esbenp.prettier-vscode
      james-yu.latex-workshop
      jdinhlife.gruvbox
      mechatroner.rainbow-csv
      ms-python.python
      ms-azuretools.vscode-docker
      ms-toolsai.jupyter
      mhutchie.git-graph
      naumovs.color-highlight
      pkief.material-icon-theme
      redhat.vscode-yaml
      ritwickdey.liveserver
      tabnine.tabnine-vscode
      yzhang.markdown-all-in-one
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
     name = "remote-ssh-edit";
     publisher = "ms-vscode-remote";
     version = "0.80.0";
     sha256 = "dab008667cd5494d49df0b0d277c16f419ea8782204a660219f9f6049268f97d";
    }
    {
     name = "remote-ssh";
     publisher = "ms-vscode-remote";
     version = "0.82.1";
     sha256 = "03eb5b714491687cfeb2f52e00f45d376d2fe8f350a832a5b3f7612e2d6d01ba";
    }
    {
     name = "remote-containers";
     publisher = "ms-vscode-remote";
     version = "0.239.0";
     sha256 = "c967933a9ce8459faf275904275dda7808d7d45b476c2b8ca2af343e20b5c814";
    }
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

  programs.vscode.userSettings = {
    ## Brackets
    "editor.bracketPairColorization.enabled" = true;
    "editor.guides.bracketPairs" = true;
    "editor.guides.bracketPairsHorizontal" = true;
    "editor.guides.highlightActiveBracketPair" = true;

    "editor.linkedEditing" = true;
    "editor.snippetSuggestions" = "top";
    "editor.gotoLocation.multipleReferences" = "goto";
    "editor.gotoLocation.multipleDefinitions" = "goto";
    "editor.gotoLocation.multipleDeclarations" = "goto";
    "editor.gotoLocation.multipleImplementations" = "goto";
    "editor.gotoLocation.multipleTypeDefinitions" = "goto";

    "diffEditor.renderSideBySide" = false;

    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay" = 10000;

    "python.formatting.provider" = "black";
    "python.linting.enabled" = true;
    "python.linting.lintOnSave" = true;

    "tabnine.experimentalAutoImports" = true;

    "workbench.iconTheme" = "material-icon-theme";
    "workbench.colorTheme" = "Gruvbox Dark Medium";

    "security.workspace.trust.untrustedFiles" = "open";

    "window.menuBarVisibility" = "toggle";
    "window.newWindowDimensions" = "offset";
  };

}
