#!/bin/sh

# Inspired from
# https://github.com/thoughtbot/dotfiles/blob/d6014c3a606df5ff589d864b1f23cb53284a612e/hooks/post-up

scriptname=`basename "$0"`

echo ""
echo "Message from '$scriptname':"

if [ -e "$HOME"/.vim/autoload/plug.vim ]; then
  echo "Upgrading vim-plug"
  vim -E -s +PlugUpgrade +qa
else
  echo "Installing vim-plug"
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing vim plugins"
vim -u "$HOME"/.vimrc.bundles +PlugUpdate +PlugClean! +qa

# Without this call the termial is broken after the Vim Plugin call above.
# Taken from: https://github.com/thoughtbot/dotfiles/blob/d6014c3a606df5ff589d864b1f23cb53284a612e/hooks/post-up#L13
reset -Q

