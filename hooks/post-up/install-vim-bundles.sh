#!/bin/sh

scriptname=`basename "$0"`

echo ""
echo "Message from '$scriptname':"

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo "Installing Vundle bundles"
vim -u $HOME/.vimrc.bundles +PluginInstall +qall
# Without this call the termial is broken after the Vim Plugin call above.
# Taken from: https://github.com/thoughtbot/dotfiles/blob/d6014c3a606df5ff589d864b1f23cb53284a612e/hooks/post-up#L13
reset -Q

