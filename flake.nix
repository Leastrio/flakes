{
  outputs = { self }: {
    templates = {
      rust.path = ./rust;
      node.path = ./node;
    };
  };
}
