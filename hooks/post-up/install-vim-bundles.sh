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

