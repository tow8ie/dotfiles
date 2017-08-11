# bash-completion: http://bash-completion.alioth.debian.org/
# Installed via Homebrew
if `which brew &> /dev/null`; then
  if [[ -f `brew --prefix`/etc/bash_completion ]]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi
