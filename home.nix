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
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [ (mkTuple [ "xkb" "eu" ]) (mkTuple [ "xkb" "us+altgr-intl" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };
};
  systemd.user.startServices = true;


}
