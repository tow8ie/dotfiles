# This script sources all the Bash completions that Homebrew installs
# by using the instructions given in the bash-completion@2 Homebrew formula.

BASH_COMPLETION_BREW_SCRIPT="/usr/local/etc/profile.d/bash_completion.sh"

[[ -r "${BASH_COMPLETION_BREW_SCRIPT}" ]] && . "${BASH_COMPLETION_BREW_SCRIPT}" 

