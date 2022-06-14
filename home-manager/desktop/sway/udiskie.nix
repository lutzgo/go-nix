{ config, pkgs, ... }:

{
  home.packages = [ pkgs.udiskie ];
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };
}
