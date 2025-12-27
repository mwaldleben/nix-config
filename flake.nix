{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    impermanence.url = "github:nix-community/impermanence";
    catppuccin.url = "github:catppuccin/nix";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      darwin,
      home-manager,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forEachSystem =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f (
            import nixpkgs {
              inherit system;
            }
          )
        );
    in
    {
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });

      formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);

      overlays = import ./overlays { inherit inputs; };

      nixosModules = import ./modules/nixos;
      darwinModules = import ./modules/darwin;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        # personal laptop
        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/nixos/thinkpad/default.nix
          ];
        };
      };

      darwinConfigurations = {
        # work laptop
        "MacBook-Pro" = darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [ ./hosts/darwin/macbook/default.nix ];
        };
      };
    };
}
