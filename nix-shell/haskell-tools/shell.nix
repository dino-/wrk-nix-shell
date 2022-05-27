# An example of a simple Haskell build env with tools I use often at the latest
# version in nixpkgs

with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    cabal-install
    ghc
    haskellPackages.hasktags
    hpack
  ];
  # shellHook is optional, here as an example
  shellHook =
    ''
      echo "Setting environment"
      export FOO="bar"
    '';
}
