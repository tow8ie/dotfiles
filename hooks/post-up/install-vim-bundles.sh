#!/bin/sh

if [ ! -e $HOME/.vim/bundle/vundle ]; then
  echo "Installing Vundle"
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "Installing Vundle bundles"
vim -u $HOME/.vimrc.bundles +PluginInstall +qa
