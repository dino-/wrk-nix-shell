# wrk-nix-shell


## Synopsis

A project to explore nix's various ways of getting shells with environments


## Description

The project serves as a testing place for me to learn nix features and also the
scripts here can be used as templates, models and examples for making new
things.


## Usage

### nix-shell

Setting up the environment various ways with `nix-shell`.

Note: Because none of these scripts are named `shell.nix` they must be
explicitly passed to `nix-shell`. Normally you would have a single file in a
directory named `shell.nix` (or `default.nix`) and `nix-shell` will load it
automatically.

An example of opening up a shell with the latest ghc that's in nixpkgs

    $ nix-shell shell-ghc-latest.nix

The same example but with a full set of tools (cabal-install, ghc, hasktags,
hpack). This example also shows `shellHook` for adding some sh script to be
executed in the new shell. Good for setting up the environment.

    $ nix-shell shell-ghc-latest-plus.nix

This example shows how to get an older, specific version of something. In this
case we get ghc v8.10.4. There are instructions in this script for using a
web-based search engine to figure out a Nix nixpkgs archive to import to get
your specific version.

    $ nix-shell shell-ghc_8_10_4.nix

Finally, an example of a shell script that uses `nix-shell` as its interpreter,
starts up `--pure` (which scrubs the environment) and then installs a couple of
tools for use in the remainder of the script. These tools will not be available
after the script exits if they weren't on the outside system already.

    $ nix-from-sh-script.sh

### nix develop (flakes)

flake.nix


## Contact

Dino Morelli <mailto:dino@ui3.info>
