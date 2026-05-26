{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.alaffont = {
    home = "/Users/alaffont";
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  environment.variables.SDKROOT = "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk";

  system.stateVersion = 5;
}
