An always growing, always improving, never ending collection of my
configuration files.

# Installation

1. Clone the repo in your home directory under the name of `.dotfiles`.

        cd && git clone https://github.com/tow8ie/dotfiles.git .dotfiles

2. Install [rcm]. If you’re using a Mac and have [Homebrew] installed
   just type `brew bundle` from within the dotfiles repository.

3. Install the dotfiles with [rcm].

        # General setup
        env RCRC=$HOME/.dotfiles/rcrc rcup

        # Or host specific setup, e.g. host 'home'
        env RCRC=$HOME/.dotfiles/rcrc rcup -B home

Subsequent runs of `rcup` no longer need the `RCRC` env variable or the host
variable being set.

## Emacs

Emacs isn’t installed by default. You have to choose between a
[Spacemacs]-based configuration and a configuration for vanilla Emacs.

*Be sure to delete or backup your existing `.emacs.d` directory beforehand if
you change between Spacemacs or Vanilla Emacs or a preexisting Emacs
configuration because the installations don’t work well with a mix of these
configuration options.*

### Spacemacs

In addition to the installation above install the `spacemacs` tag and
install [Spacemacs] itself:

    rcup -t spacemacs
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

### Vanilla Emacs

In addition to the installation above install the `vanilla-emacs` tag:

    rcup -t vanilla-emacs

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
[Spacemacs]: http://spacemacs.org/

[1]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

