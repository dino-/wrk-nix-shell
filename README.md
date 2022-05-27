# wrk-nix-shell


## Synopsis

A project to explore nix's various ways of getting shells with environments


## Description

The project serves as a testing place for me to learn nix features and also the
scripts here can be used as templates, models and examples for making new
things.


## Usage

### nix-shell

Setting up the environment various ways with `nix-shell`, which is the
pre-flakes way of doing things.

In each of these example directories, cd into the dir and execute `nix-shell`.
The `shell.nix` file will automatically be executed and you should end up in a
shell.

Directory `nix-shell/haskell-tools`

An example of a shell with a full set of tools (cabal-install, ghc, hasktags,
hpack). This example also shows `shellHook` for adding some sh script commands
in a string to be executed in the new shell. Good for setting up the
environment.

Directory `nix-shell/ghc_8_10_4`

This example shows how to get an older, specific version of something. In this
case we get ghc v8.10.4. There are instructions in this script for using a
web-based search engine to figure out a Nix nixpkgs archive to import to get
your specific version.

Finally, an example of a shell script that uses `nix-shell` as its interpreter,
starts up `--pure` (which scrubs the environment) and then installs a couple of
tools for use in the remainder of the script. These tools will not be available
after the script exits if they weren't on the system already.

    $ ./nix-shell/nix-from-sh-script.sh

### nix develop (nix flakes)

The more modern way to get a development shell is with Nix flakes. To use this
example:

    $ cd nix-flakes
    $ nix develop

The `flake.nix` file will be be used to set up the environment. In it, in the
definition

    devShell.x86_64-linux = pkgs.mkShell { ...

you can see the familiar parts from the nix-shell examples (`buildInputs`,
`shellHook`).

It's customary to add the generated `flake.lock` file to source control, but
don't take the one from this project. Let nix generate one for your project.

Nix will expect your `flake.nix` file to be in git source control when `nix
develop` is run. If this isn't desired, run it this way instead:

    $ nix develop path:.


## Contact

Dino Morelli <mailto:dino@ui3.info>
