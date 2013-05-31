# ------ #
# Editor #
# ------ #

export EDITOR='vim'
# This is to make tmux correctly show the solarized vim theme
# which otherwise shows the right colors only behing text
export TERM=screen-256color

# ---------------- #
# Path definitions #
# ---------------- #

export RBENV_BIN_PATH="$HOME/.rbenv/bin"
export MACPORTS_PATH="/opt/local/bin"
export NPM_BIN_PATH="/usr/local/share/npm/bin"
export DART_BIN_PATH="$HOME/dart/dart-sdk/bin"
export NODE_PATH=/usr/local/lib/jsctags/:\$NODE_PATH
export PATH=~/.bin:~/bin:$RBENV_BIN_PATH:$NPM_BIN_PATH:/usr/local/bin:$MACPORTS_PATH:$DART_BIN_PATH:$PATH

# ------- #
# Node.js #
# ------- #

export NODE_PATH=/usr/local/lib/node_modules

# ------ #
# cdargs #
# ------ #

# This was prompted to be installed by the cdargs brew formula
if [ -f /usr/local/etc/bash_completion.d/cdargs-bash.sh ];
then
  source /usr/local/etc/bash_completion.d/cdargs-bash.sh
fi

