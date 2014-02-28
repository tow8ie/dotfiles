if `which brew &> /dev/null`; then
  if [[ -f `brew --prefix`/etc/bash_completion.d/tmux ]]; then
    . `brew --prefix`/etc/bash_completion.d/tmux
  fi
fi

