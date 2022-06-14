{ pkgs, lib, persistence, ... }: {

home.packages =  with pkgs; [
  keepassxc
];

#  home.persistence = lib.mkIf persistence {
#    "/persist/home/lgo".directories = [ ".config/BraveSoftware" ];
#  };
}
