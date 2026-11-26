{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [slack thunderbird zoom-us zotero];
  nixpkgs.config.permittedInsecurePackages = [ 
      "firefox-esr-140-bin-unwrapped-140.17.0esr" # for zotero
  ];
}
