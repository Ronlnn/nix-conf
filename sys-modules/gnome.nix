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
      xkb = {
        layout = "us,ru";
        variant = "";
        model = "pc104";
        options = "grp:alt_shift_toggle";
      };
  };
}
