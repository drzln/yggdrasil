#!/usr/bin/env sh
[ -z "$(which git)" ] && nix-env -iA nixos.git

BRANCH=main
REPO=https://github.com/drzln/yggdrasil.git
DIR=/app/yggdrasil
LOCAL=0

if [ "$LOCAL" -eq 1 ]; then
  nix-env -iA nixos.nfs-utils
else
  if ! [ -d $DIR ]; then
    mkdir -p $DIR && git clone -b $BRANCH $REPO
  fi
fi
