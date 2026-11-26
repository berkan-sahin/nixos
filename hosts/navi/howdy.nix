{pkgs, ...} :
{
	services.howdy = {
		enable = true;
		control = "sufficient"; # use just the face to authenticate
	};
	services.linux-enable-ir-emitter.enable = true;
}
