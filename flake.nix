{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    impermanence.url = "github:nix-community/impermanence";
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = _: {
        nixosConfigurations.dari = inputs.nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            inputs.impermanence.nixosModules.impermanence
            inputs.stylix.nixosModules.stylix

            ./hosts/dari
            ./system
          ];
        };
      };

      systems = [
        "aarch64-linux"
      ];

      imports = with inputs; [
        treefmt-nix.flakeModule
      ];

      perSystem = _: {
        treefmt = {
          projectRootFile = "flake.nix";

          programs = {
            deadnix.enable = true;
            statix.enable = true;
            nixfmt.enable = true;
          };
        };
      };

    };
}
