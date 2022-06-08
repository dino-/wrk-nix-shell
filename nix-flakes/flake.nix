# This is intended to replace `nix-shell` and should be run like:
#   $ nix develop
#
# To use this in a new dir without adding flake.nix to git:
#   $ nix develop path:.

{ 
  description = "A basic shell";

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };

    in {
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          cabal-install
          ghc
          haskellPackages.hasktags
          hpack
        ];

        shellHook = ''
          # A prompt that will feel familiar to nix-shell users
          export PS1="\n\[\033[1;32m\][nix flake:\w]\$\[\033[0m\] "

          echo "We're now in a nix flake develop shell!"
        '';
      };
    };
}
