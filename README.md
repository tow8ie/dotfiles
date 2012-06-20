An always growing, always improving, never ending collection of my
configuration files.

# Installation

Install them from within the repository via the included bash script:

    $ ./install.sh .

Files or directories that have a name starting with an underscore will be
linked as dotfile to the home dir.

For example:

- `~/.vimrc -> /path/to/dotfiles/repo/_vimrc`

You’ll be prompted before any destructive operation (like overwriting an
existing file, e.g.) will be performed.

