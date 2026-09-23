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

        erlangVersion = "erlang_29";
        elixirVersion = "elixir_1_20";

        beam = pkgs.beam.packages.${erlangVersion}
        
        elixir = beam.${elixirVersion};
        erlang = pkgs.beam.interpreters.${erlangVersion};
        expert = beam.expert;
      in rec {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            elixir
            erlang
            expert
          ];
          ERL_AFLAGS = "-kernel shell_history enabled";
        };
      }
    );
}
