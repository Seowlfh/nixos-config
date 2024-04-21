{
  description = "NixOs configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager?ref=release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          NIX_CONFIG = "extra-experimental-features = nix-command flakes";
          nativeBuildInputs = builtins.attrValues {
            inherit (pkgs)
              home-manager
              git
              vim
              ;
          };
        };

        dev = pkgs.mkShell {
          nativeBuildInputs = builtins.attrValues {
            inherit (pkgs)
              nixpkgs-fmt
              nil
              ;
          };
        };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;

      nixosConfigurations = import ./hosts { inherit inputs pkgs lib system; };

      homeConfigurations = import ./home { inherit pkgs home-manager unstable; };
    };
}
