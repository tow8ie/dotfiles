#!/usr/bin/env bash

set -ueo pipefail

if [ -d "$HOME/.config/emacs" ]; then
  echo "$HOME/.config/emacs already exists. Skipping installation of Doom Emacs."
else
    git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.config/emacs
    $HOME/.config/emacs/bin/doom install
fi
