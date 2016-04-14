#!/bin/sh

if which brew &> /dev/null; then
  if ! brew bundle check --global &> /dev/null; then
    echo "Installing global Homebrew formulas"
    brew bundle --global
  fi
fi

