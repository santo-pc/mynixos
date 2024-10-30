{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, hyprland, ... }@inputs:
    let
    lib = nixpkgs.lib;
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.san = import ./home.nix;

            }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };

      };
    };

    homeConfigurations."san@nixos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
      {
        # wayland.windowManager.hyprland = {
        #   enable = true;
        #   package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # };
      }
      ];
    };
  };
}
