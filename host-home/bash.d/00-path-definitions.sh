# These path definitions will be _prepended_ to $PATH.
# Order dependent, most important first.
pre_path_definitions=(
  bin                                                  # Bundler binstubs
  $HOME/.bin                                           # dotfiles bins
  $HOME/bin                                            # Personal bins
  /Applications/Postgres.app/Contents/Versions/9.3/bin # Postgres.app bins
  /usr/local/bin                                       # Homebrew bins
)

# These path definitions will be _appended_ to $PATH.
# Order dependent, most important first.
post_path_definitions=(
  ./node_modules/.bin       # npm local bins
)

