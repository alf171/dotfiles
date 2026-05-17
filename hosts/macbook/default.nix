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

  system.stateVersion = 5;
}
