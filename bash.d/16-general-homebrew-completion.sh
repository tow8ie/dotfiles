# This script sources all the Bash completions that Homebrew generally places
# into the bash_completion.d directory.

if `which brew &> /dev/null`; then
  if [[ -d `brew --prefix`/etc/bash_completion.d ]]; then
    for completion in `brew --prefix`/etc/bash_completion.d/*; do
      if [[ -r $completion ]]; then
        # The ctest bash completion script from Homebrew is broken.
        if [[ `basename $completion` != 'ctest' ]]; then
          source $completion
        fi
      fi
    done
  fi
fi

