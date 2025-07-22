{
  description = "NixOS configuration test";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs"; # Use system packages list where available
    };


    hyprland.url = "github:hyprwm/Hyprland";

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, hyprland, ... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    globals = import ./globals.nix;
  in
  {
    nixosConfigurations = {
      nixos-personal = lib.nixosSystem rec {
        inherit system;

        specialArgs = {
          inherit pkgs-unstable;
          inherit hyprland;
          inherit inputs;
          inherit globals;
        };

        modules = [
            ./configuration.nix         
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.san = import ./home/home.nix;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.backupFileExtension = "backup";
            }
        ];

      };
    };
  };
}
