#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="${HOME}/.dotfiles"

cd $HOME

if [[ -d "${DOTFILES_DIR}" ]]; then
  echo "${DOTFILES_DIR} already exists, skipping install"
else
  git clone git@github.com:tow8ie/dotfiles.git "#{DOTFILES_DIR}"
fi

"${DOTFILES_DIR}/bin/dotfiles-update.sh"

