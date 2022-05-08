# An example that gets the most recent ghc version
with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    ghc
  ];
}
