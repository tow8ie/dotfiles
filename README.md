An always growing, always improving, never ending collection of my
configuration files.

# Installation

1. Clone the repo in your home directory under the name of `.dotfiles`.

        cd && git clone https://github.com/tow8ie/dotfiles.git .dotfiles

2. Install [rcm]. If you’re using a Mac and have [Homebrew] installed
   just type `brew bundle` from within the dotfiles repository.

3. Install the dotfiles with [rcm].

        rcup -x README.md -x Brewfile

Subsequent runs of `rcup` no longer need the `-x` options.

## Mac-specific additions

When running the `brew bundle` command of [Homebrew] a wrapper/helper script
gets installed that fixes the problem that when using tmux [on Mac OS X the
system clipboard is not available by default][1].

Also, [Cask] is installed, which is used by [Pallet] for managing Emacs
package dependencies.

[rcm]: https://github.com/thoughtbot/rcm
[Homebrew]: http://brew.sh/
[Cask]: http://cask.github.io/
[Pallet]: https://github.com/rdallasgray/pallet

[1]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

