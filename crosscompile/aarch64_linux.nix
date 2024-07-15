with import <nixpkgs> {
  crossSystem = {
    config = "aarch64-unknown-linux-gnu";
  };
};

mkShell {
  buildInputs = [ gcc9 openssl cmake ];
}