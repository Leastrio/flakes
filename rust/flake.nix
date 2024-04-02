{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nmattia/naersk";
  };

  outputs = { self, nixpkgs, utils, naersk, ... } @inputs:
    utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages."${system}";
        naersk-lib = naersk.lib."${system}";      
      in rec {
        defaultPackage = naersk-lib.buildPackage {
          root = ./.;
        }; 
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustc
            rust-analyzer
            cargo
          ];
          RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
        };
      }
    );
}
