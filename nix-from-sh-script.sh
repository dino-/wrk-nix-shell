#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p coreutils -p which

# A truly reproducable toolset in here. We specify --pure to scrub the env and
# then get everything we need from nix.

which whoami
whoami
