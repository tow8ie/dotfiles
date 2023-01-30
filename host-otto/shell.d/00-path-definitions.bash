# These path definitions will be _prepended_ to $PATH.
# Order dependent, most important first.

pre_path_definitions=(

  # Bundler binstubs
  # ./bin

  # dotfiles bins
  $HOME/.bin

  # Visual Studio Code
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  # Personal bins
  $HOME/bin

  # npm global bins
  # /usr/local/share/npm/bin

  # Homebrew bins
  /usr/local/bin

  # Homebrew bins
  /usr/local/sbin

  # Cask bins
  $HOME/.cask/bin

  # Macport bins
  # /opt/local/bin

  # Dart bins
  # $HOME/dart/dart-sdk/bin

  # Vmware bins
  # $HOME/bin/vmware

  # cabal (Haskell)
  # $HOME/Library/Haskell/bin

)

# These path definitions will be _appended_ to $PATH.
# Order dependent, most important first.

post_path_definitions=(

  # Unversioned symlinks for Python installed by Homebrew
  /usr/local/opt/python/libexec/bin/

  # pipx
  $HOME/.local/bin

  # npm local bins
  # ./node_modules/.bin

  # yarn
  # `yarn global bin`

)

