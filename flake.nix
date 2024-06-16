{
  outputs = { self }: {
    templates = {
      elixir.path = ./elixir;
      rust.path = ./rust;
      go.path = ./go;
      node.path = ./node;
      gleam.path = ./gleam;
    };
  };
}
