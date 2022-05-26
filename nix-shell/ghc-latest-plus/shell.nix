# An example of a simple Haskell build env with tools I use often
with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    cabal-install
    ghc
    haskellPackages.hasktags
    hpack
  ];
  shellHook =
    ''
      echo "Setting environment"
      export FOO="bar"
    '';
}
