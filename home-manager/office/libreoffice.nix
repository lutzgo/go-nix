{ pkgs, lib, persistence, ... }: {

home.packages = with pkgs; [
  hunspellDicts.de_DE
  hunspellDicts.en_US
  joplin
  joplin-desktop
  libreoffice-fresh
  pandoc
];

#  home.persistence = lib.mkIf persistence {
#    "/persist/home/lgo".directories = [ ".config/BraveSoftware" ];
#  };
}
