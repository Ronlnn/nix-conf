{config, pkgs, ...}: 
{
	users.users.roninn = {
		isNormalUser = true;
		description = "roninn";
		extraGroups = ["networkmanager" "wheel" "audio" "video"];
		packages = with pkgs; [
			kdePackages.kate
		];	
	};
}
