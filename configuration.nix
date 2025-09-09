{ config, pkgs, ... }:

{
  imports =
    [
      ./packages.nix
      ./sys-modules/keyboard.nix
      ./sys-modules/language.nix
      ./sys-modules/sound.nix
      ./sys-modules/user.nix
      ./sys-modules/xserver.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "omen";
  networking.networkmanager.enable = true;


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
