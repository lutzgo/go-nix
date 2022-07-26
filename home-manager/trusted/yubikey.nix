{ pkgs, lib, persistence, ... }: {

home.packages =  with pkgs; [
  age-plugin-yubikey
  yubikey-manager
  yubikey-manager-qt
  yubikey-personalization
  yubikey-personalization-gui
  yubioath-desktop
];

#  home.persistence = lib.mkIf persistence {
#    "/persist/home/lgo".directories = [ ".config/BraveSoftware" ];
#  };
}
