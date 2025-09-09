{ config, pkgs, ... }:

{
  imports =
    [
      ./packages.nix
      ./sys-modules/network.nix
      ./sys-modules/nvidia.nix
      ./sys-modules/keyboard.nix
      ./sys-modules/language.nix
      ./sys-modules/sound.nix
      ./sys-modules/user.nix
      ./sys-modules/xserver.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nekoray.enable = true;
  programs.nekoray.tunMode.enable = true;

  networking.hostName = "omen";


  nix.settings.experimental-features = ["nix-command" "flakes"];


  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.firefox.enable = true;



  nix.gc = {
  	automatic = true;
  	dates = "weekly";
  	options = "--delete-older-than 3d";
  };

  system.stateVersion = "25.05";
}
