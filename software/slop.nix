{pkgs, ...}:
{
	#LLM stuff
	environment.systemPackages = with pkgs; [claude-code];
}
