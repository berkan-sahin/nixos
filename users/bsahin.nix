{pkgs, ...} :
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."bsahin" = {
    isNormalUser = true;
    description = "Berkan Sahin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
      krita
      libreoffice
      floorp-bin
    ];
  };
}
