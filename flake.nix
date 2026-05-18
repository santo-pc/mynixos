{
  description = "NixOS configuration test";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      hyprland,
      noctalia,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      globals = import ./globals.nix;
    in
    {
      nixosConfigurations = {
        santiago-ws = lib.nixosSystem rec {
          inherit system;

          specialArgs = {
            inherit pkgs-unstable;
            inherit hyprland;
            inherit inputs;
            inherit globals;
            inherit noctalia;
          };

          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${globals.user.username}" = import ./home/home.nix;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.backupFileExtension = "backup";
              home-manager.sharedModules = [
                # vicinae.homeManagerModules.default
                noctalia.homeModules.default
                # nix-colors.homeManagerModules.default
              ];
            }
          ];

        };
      };
    };
}
