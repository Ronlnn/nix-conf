{ config, lib, pkgs, ... }:

{
  imports = [
      ./gdm.nix
  ];

    # Выключаем дефолтные программы
    services.gnome.core-apps.enable = true;

    services.xserver = {
      # Включение gnome
      desktopManager.gnome.enable = true;
      # Клавиатура
      xkb = {
        layout = "us,ru";
        variant = "";
        model = "pc104";
        options = "grp:alt_shift_toggle";
      };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.system-monitor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
  ];
}
