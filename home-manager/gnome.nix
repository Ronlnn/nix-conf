{ config, pkgs, ... }:

{
  # Настройки GNOME для раскладки клавиатуры
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (tuple "xkb" "us")
        (tuple "xkb" "ru")
      ];
      xkb-options = [
        "grp:alt_shift_toggle"
      ];
    };
  };
}