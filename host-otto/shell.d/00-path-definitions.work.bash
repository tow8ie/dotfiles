# These path definitions will be _prepended_ to $PATH.
# Order dependent, most important first.
pre_path_definitions=(
  # ./bin                            # Bundler binstubs
  $HOME/.bin                         # dotfiles bins
  $HOME/bin                          # Personal bins
  # /usr/local/share/npm/bin         # npm global bins
  /usr/local/bin                     # Homebrew bins
  /usr/local/opt/python/libexec/bin/ # Unversioned symlinks for Python installed by Homebrew
  $HOME/.cask/bin                    # Cask bins
  # /opt/local/bin                   # Macport bins
  # $HOME/dart/dart-sdk/bin          # Dart bins
  # $HOME/bin/vmware                 # Vmware bins
  # $HOME/Library/Haskell/bin        # cabal (Haskell)
)

# These path definitions will be _appended_ to $PATH.
# Order dependent, most important first.
post_path_definitions=(
  # ./node_modules/.bin # npm local bins
  # `yarn global bin`   # yarn
)

