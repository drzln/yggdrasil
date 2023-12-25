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

RBENV_DIR=~/.rbenv
RBENV_REPO=https://github.com/rbenv/rbenv.git
RBENV_BRANCH=master
RUBYBUILD_DIR=$RBENV_DIR/plugins/ruby-build
RUBYBUILD_REPO=https://github.com/rbenv/ruby-build.git
RUBYBUILD_BRANCH=master
GEMSET_DIR=$RBENV_DIR/plugins/rbenv-gemset
GEMSET_REPO=https://github.com/jf/rbenv-gemset.git
GEMSET_BRANCH=master

if ! [ -d $RBENV_DIR ]; then
  git clone \
    -b $RBENV_BRANCH \
    $RBENV_REPO \
    $RBENV_DIR
fi

if ! [ -d $RUBYBUILD_DIR ]; then
  git clone \
    -b $RUBYBUILD_BRANCH \
    $RUBYBUILD_REPO \
    $RUBYBUILD_DIR
fi

if ! [ -d $GEMSET_DIR ]; then
  git clone \
    -b $GEMSET_BRANCH \
    $GEMSET_REPO \
    $GEMSET_DIR
fi
