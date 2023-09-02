An always growing, always improving, never ending collection of my
configuration files.

# Prerequisites

You need to have [rcm] installed.

# Installation

1. Clone the repo in your home directory under the name of `.dotfiles`:

   ```bash
   cd && git clone https://github.com/tow8ie/dotfiles.git .dotfiles
   ```

2. Install the dotfiles:

   ```bash
   ./install.sh
   # or
   ./install-otto.sh
   ```

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

```bash
rcup -t spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

### Vanilla Emacs

In addition to the installation above install the `vanilla-emacs` tag:

```bash
rcup -t vanilla-emacs
```

[rcm]: https://github.com/thoughtbot/rcm
[Spacemacs]: http://spacemacs.org/

