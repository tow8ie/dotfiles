#!/bin/sh

if which apm > /dev/null; then
  if ! apm list --installed | grep package-sync > /dev/null; then
    echo "Atom package 'package-sync' needs to be installed."
    if apm install package-sync; then
      echo "Atom package 'package-sync' successfully installed."
    else
      echo "Installation of Atom package 'package-sync' failed."
    fi
  fi
fi

