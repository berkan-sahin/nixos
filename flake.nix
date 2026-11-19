{
   description = "Configuration flake for my NixOS machines";

   inputs = {
   	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
   };

   outputs = {self, nixpkgs}: {
	nixosConfigurations = {
		navi = nixpkgs.lib.nixosSystem { # main machine, laptop
			system = "x86_64-linux";
			modules = [
				# host-specific
				./hosts/navi/configuration.nix
				./hosts/navi/hardware-configuration.nix
				./hosts/navi/battery-limit.nix

				# fonts
				./misc/nerd-fonts.nix
			];
		};
		usagi = nixpkgs.lib.nixosSystem { # """homeserver"""
			system = "x86_64-linux";
			modules = [
				# host-specific
				./hosts/usagi/configuration.nix
				./hosts/usagi/hardware-configuration.nix
			];
		};
	};
   };
}
