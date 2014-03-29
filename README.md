An always growing, always improving, never ending collection of my
configuration files.

# Installation

1. Clone the repo in your home directory under the name of `.dotfiles`.

        cd && git clone git@github.com:tow8ie/dotfiles.git .dotfiles

2. Install [rcm][1]. If you’re using a Mac and have [Homebrew][2] installed
   just type `brew bundle` from within the dotfiles repository.

3. Install the dotfiles with [rcm][1].

        rcup -x README.md -x Brewfile

Subsequent runs of `rcup` no longer need the `-x` options.

## Mac-specific additions

When running the `brew bundle` command of [Homebrew][2] a wrapper/helper script
gets installed that fixes the problem that when using tmux [on Mac OS X the
system clipboard is not available by default][3].

Also, [Cask][4] is installed, which is used by [Pallet][5] for managing Emacs
package dependencies.

[1]: https://github.com/thoughtbot/rcm
[2]: http://brew.sh/
[3]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
[4]: http://cask.github.io/
[5]: https://github.com/rdallasgray/pallet

