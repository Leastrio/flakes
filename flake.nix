{
  outputs = { self }: {
    templates = {
      elixir.path = ./elixir;
      rust.path = ./rust;
      go.path = ./go;
      gleam.path = ./gleam;
      c.path = ./c;
    };
  };
}
