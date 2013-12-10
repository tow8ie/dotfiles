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

## Mac-specific installation

When using tmux [on Mac OS X the system clipboard is not available by
default][1]. To fix this install a wrapper/helper script via Homebrew.

1. Install [Brewdler][2].
2. `brewdle install`

[1]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
[2]: https://github.com/andrew/brewdler

