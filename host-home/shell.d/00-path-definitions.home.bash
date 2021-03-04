# These path definitions will be _prepended_ to $PATH.
# Order dependent, most important first.

pre_path_definitions=(

  # Bundler binstubs
  bin

  # dotfiles bins
  $HOME/.bin

  # Visual Studio Code
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  # Personal bins
  $HOME/bin

  # Postgres.app bins
  /Applications/Postgres.app/Contents/Versions/9.3/bin

  # Homebrew bins
  /usr/local/bin

  # Homebrew bins
  /usr/local/sbin

  # Rust bins
  $HOME/.cargo/bin

)

# These path definitions will be _appended_ to $PATH.
# Order dependent, most important first.

post_path_definitions=(

  # npm local bins
  ./node_modules/.bin

)

