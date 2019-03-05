#!/bin/sh

if which brew &> /dev/null; then
  if ! brew bundle check --global --no-upgrade &> /dev/null; then
    echo "Installing global Homebrew formulas"
    brew bundle --global --no-upgrade --verbose
  fi
fi

