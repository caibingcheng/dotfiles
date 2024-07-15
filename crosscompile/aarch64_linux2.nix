let
    # this will use aarch64 binaries from binary cache, so no need to build those
    pkgsArm = import <nixpkgs> {
        config = {};
        overlays = [];
        system = "aarch64-linux";
    };

    # these will be your cross packages
    pkgsCross = import <nixpkgs> {

       overlays = [(self: super: {

         # we want to hack on SDL, don't want to hack on those. Some even don't cross-compile
         inherit (pkgsArm)
           gcc9 openssl cmake boost
         ;

       })];
       crossSystem = {
         config = "aarch64-unknown-linux-gnu";
       };
     };

in pkgsCross.SDL2.override {
      # those shouldn't be neither pkgsCross, nor pkgsArm
      # because those trigger
      #     cannot execute binary file: Exec format error
      # in this case it was enough to just use buildPackages variants
      # but in general there may be problems
      inherit (pkgsCross.buildPackages)
         # wayland wayland-protocols
      ;
   }