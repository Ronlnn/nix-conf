{ inputs, config, lib, pkgs,  ... }:

{
  imports = [
	./home-manager/git.nix
	./home-manager/alacritty.nix
  ];

 home = {
  username = "roninn";
  homeDirectory = "/home/roninn";
  stateVersion = "25.05";
 };

  systemd.user.startServices = true;


}
