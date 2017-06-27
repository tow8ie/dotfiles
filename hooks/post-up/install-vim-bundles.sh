#!/bin/sh

scriptname=`basename "$0"`

echo ""
echo "Message from '$scriptname':"
echo "The rcm post hook for auto-installing vim bundles does not work at the moment and should be fixed. :-("

# if [ ! -e $HOME/.vim/bundle/vundle ]; then
#   echo "Installing Vundle"
#   git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
# fi
#
# echo "Installing Vundle bundles"
# vim -u $HOME/.vimrc.bundles +PluginInstall +qa

