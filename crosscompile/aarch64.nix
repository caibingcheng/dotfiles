with import <nixpkgs> {
  crossSystem = {
    config = "aarch64-unknown-linux-gnu";
  };
};

mkShell {
  buildInputs = [ zlib ]; # your dependencies here
}