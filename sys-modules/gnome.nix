{ config, pkgs, ... }:

{
  imports = [
    ./gdm.nix
  ];

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us,ru";
      variant = "";
      options = "grp:alt_shift_toggle";
    };

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  console.keyMap = "us";

  # Настройки для GNOME через dconf
  programs.dconf = {
    enable = true;
    profiles.user.databases = [{
      settings = {
        "org/gnome/desktop/input-sources" = {
          sources = [
            "xkb:us"
            "xkb:ru"
          ];
          xkb-options = ["grp:alt_shift_toggle"];
        };
      };
    }];
  };
}