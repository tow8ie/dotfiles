typeset -gx -U path

path=(

  # ./bin                     # Bundler binstubs
  $HOME/.bin                # dotfiles bins
  $HOME/bin                 # Personal bins
  # /usr/local/share/npm/bin  # npm global bins
  /usr/local/bin            # Homebrew bins
  $HOME/.cask/bin           # Cask bins
  # /opt/local/bin            # Macport bins
  # $HOME/dart/dart-sdk/bin   # Dart bins
  # $HOME/bin/vmware          # Vmware bins
  # $HOME/Library/Haskell/bin # cabal (Haskell)

  $path                     # -- DEFAULT --

  # ./node_modules/.bin       # npm local bins
  # `yarn global bin`         # yarn

)

export PATH

