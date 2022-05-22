let
  pkgs = import (builtins.fetchTarball {
    # This URL was discovered by looking for 'ghc' at the Nix package versions
    # search tool https://lazamar.co.uk/nix-versions/
    # It corresponds to the point in time when GHC was at version 8.10.4
    url = "https://github.com/NixOS/nixpkgs/archive/9986226d5182c368b7be1db1ab2f7488508b5a87.tar.gz";
  }) {};

  ghc_8_10_4 = pkgs.ghc;
in
with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    ghc_8_10_4
  ];
}
