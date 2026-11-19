{
  inputs, pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default # default, beta, twilight, or twilight-official
  ];
}
