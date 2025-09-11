{ config, lib, pkgs, ... }:

{
  imports = [
      ./gdm.nix
  ];
    # Включение gnome
    services.xserver.desktopManager.gnome.enable = true;
    # Выключаем дефолтные программы
    services.gnome.core-apps.enable = true;

    services.xserver = {
      xkb.layout = "us,ru";
      xkbVariant = "";
      xkbOptions = "grp:win_space_toggle";
  };
}