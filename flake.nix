{
   description = "Configuration flake for my NixOS machines";

   inputs = {
   	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        zen-browser = {
      	  url = "github:0xc000022070/zen-browser-flake";
          inputs.nixpkgs.follows = "nixpkgs";
	};
   };

   outputs = inputs@{self, nixpkgs, zen-browser}: {
	nixosConfigurations = {
		navi = nixpkgs.lib.nixosSystem { # main machine, laptop
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				# host-specific
				./hosts/navi/configuration.nix
				./hosts/navi/hardware-configuration.nix
				./hosts/navi/battery-limit.nix
				./hosts/navi/bluetooth.nix
				./hosts/navi/howdy.nix

				# users
				./users/bsahin.nix

				# services
				./srv/tailscale.nix

				# fonts
				./misc/nerd-fonts.nix

				# software
				./software/zen-browser.nix # browser
				./software/editors.nix # VSCode, emacs, nvim etc.
				./software/productivity.nix # email, slack, zoom etc.
				./software/slop.nix # ai slop
			];
		};
		usagi = nixpkgs.lib.nixosSystem { # """homeserver"""
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				# host-specific
				./hosts/usagi/configuration.nix
				./hosts/usagi/hardware-configuration.nix
			];
		};
	};
   };
}
