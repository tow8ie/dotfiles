typeset -gx -U path

path=(

  bin                                                  # Bundler binstubs
  $HOME/.bin                                           # dotfiles bins
  $HOME/bin                                            # Personal bins
  /Applications/Postgres.app/Contents/Versions/9.3/bin # Postgres.app bins
  /usr/local/bin                                       # Homebrew bins

  $path                                                # -- DEFAULT --

  ./node_modules/.bin                                  # npm local bins

)

export PATH

