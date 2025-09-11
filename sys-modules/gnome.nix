{ config, lib, pkgs, ... }:

{
  imports = [
      ./gdm.nix
  ];

    # Включение gnome
    services.xserver.desktopManager.gnome.enable = true;

    services.xserver.enable = true;
    # Клавиатура
    services.xserver.xkb = {
      layout = "us,ru";
      variant = "";
      options = "grp:alt_shift_toggle";
    };

    # Выключаем дефолтные программы
    services.gnome.core-apps.enable = true;
}