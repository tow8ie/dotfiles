# ------- #
# Utility #
# ------- #

# I don’t like swearing, but I like the f*** utility program.
alias yuck='fuck'
alias yak='fuck'

# ------------------------ #
# Directories and movement #
# ------------------------ #

alias l='ls -FG'
alias la='l -A'
alias lv='l -l'
alias lav='la -l'
# List only dotfiles
alias l.='l -d .[^.]*'
alias l.v='ls -l -d .[^.]*'

function cdl() {
  cd $1; l
}
alias s='cd ..'
function sl() {
  s; l
}

alias mkd='mkdir'
alias mkdr='mkdir -p'
function take() {
  mkdir -p "$1"
  cd "$1"
}

# Show a tree listing with directories having a trailing slash and hidden files
alias tre='tree -Fa'

# --- #
# Git #
# --- #

alias gti='git'

# ------ #
# ranger #
# ------ #

alias r='ranger'

# --------- #
# Checksums #
# --------- #

alias sha256='shasum -a 256'
alias sha1='openssl sha1'

# Check the Existence of a Command in Bash and Zsh
# @see: https://www.topbug.net/blog/2016/10/11/speed-test-check-the-existence-of-a-command-in-bash-and-zsh/
if ! (( $+commands[md5] )); then
  alias md5='openssl md5'
fi

