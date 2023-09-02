typeset -gx -U path

# Zshell path management best-practice are explained in these posts:
# - https://superuser.com/a/598924/758111
# - https://stackoverflow.com/a/13060074

# What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

if (( $+commands[brew] )); then
  if brew ls | grep asdf &> /dev/null; then
    source $(brew --prefix asdf)/libexec/asdf.sh
  fi
fi

path=(

  # bin                                                # Bundler binstubs
  $HOME/.bin                                           # dotfiles bins
  $HOME/bin                                            # Personal bins

  $path                                                # -- DEFAULT --

  # ./node_modules/.bin                                # npm local bins

)

export PATH
