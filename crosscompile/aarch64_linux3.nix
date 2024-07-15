{ pkgs ? import <nixpkgs> {} }:

let
 # Specify the packages to cross-compile
 packages = [
    pkgs.gcc9
    pkgs.boost
    pkgs.openssl
    # Add any other packages here
 ];

 # Create a derivation for the cross-compilation environment
 env = pkgs.stdenv.mkDerivation {
    name = "aarch64-unknown-linux-gnu";
    buildInputs = packages;
    shellHook = ''
      export CC=${pkgs.crossSystem.config.targetPrefix}gcc
      export CXX=${pkgs.crossSystem.config.targetPrefix}g++
      export PKG_CONFI_PATH=${pkgs.lib.makeBinPath [ pkgs.openssl.dev ]}
      # Set other environment variables as needed
    '';
 };
in
 env
