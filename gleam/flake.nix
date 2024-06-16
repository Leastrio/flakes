{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let 
        pkgs = import nixpkgs { inherit system; };

        gleam = pkgs.gleam;
        erlang = pkgs.beam.interpreters.erlang_27;
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            gleam
            erlang
          ];
        };
      }
    );
} 
