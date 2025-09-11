{ config, lib, pkgs, ... }:

{
    # Включаем X11 и GDM
    services.xserver.enable = true;
    services.xserver.displayManager.gdm = {
      enable = true;
      wayland = false; # по желанию, можно отключить
    };
}