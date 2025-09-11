{ config, pkgs, ... }:

{

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        "xkb:us"  # Более простой формат
        "xkb:ru"
      ];
      xkb-options = ["grp:alt_shift_toggle"];
    };
  };
}