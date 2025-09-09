{config, pkgs, ...}:
{
	services.xserver = {
		enable = true;
		
		xkb = {
			layout = "us,ru";
			variant = "";
			options = "grp:alt_shift_toggle";
		};
	};
	console.keyMap = "us";
}
