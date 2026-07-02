{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }:
  let
    mkPkgs = system:
      import nixpkgs {
        inherit system;
      };
  in
  {
    darwinConfigurations.macbook =
      nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./hosts/macbook/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alaffont = import ./home/common.nix;
          }
        ];
      };

    homeConfigurations."alaffont@firecracker" =
      home-manager.lib.homeManagerConfiguration {
        pkgs = mkPkgs "x86_64-linux";

        modules = [
          {
            home.username = "alaffont";
            home.homeDirectory = "/home/alaffont";
          }
          ./home/common.nix
        ];
      };
  };
}
