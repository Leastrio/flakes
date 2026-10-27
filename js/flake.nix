{
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.bun
            pkgs.tailwindcss-language-server
          ];
        };
      }
    );
}
