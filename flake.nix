{
  description = "Capstone devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
    let
      # Helper to provide system-specific attributes
      pkgs = import nixpkgs { inherit system; };
    in {
        devShells.default = pkgs.callPackage ./dev.nix {inherit pkgs; };
    }
  );
}

