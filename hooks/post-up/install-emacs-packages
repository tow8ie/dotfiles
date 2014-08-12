#!/bin/sh

if which cask > /dev/null; then
  if [ -f $HOME/.emacs.d/Cask ]; then
    echo 'Installing Cask packages'
    cd $HOME/.emacs.d
    cask install
  fi
fi

