# ------- #
# Utility #
# ------- #

# Reload the .bashrc
alias rl="source ~/.bashrc"

# Use the vi mode to edit the shell input
alias vishell='set -o vi'

# a less that parses color codes and doesn’t prompt for
# "Is it a binary file?"
alias less='less -Rfi'

# A simple little timer helper
alias timer='echo "Stop timer with Ctrl-D" && date && time cat && date'

alias webserver='python -m SimpleHTTPServer'

# I don’t like swearing, but I like the f*** utility program.
alias yuck='fuck'

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

# ------ #
# System #
# ------ #

alias f='find . -name'

# Physically eject a disc (Mac OS X)
alias eject-disc='drutil tray eject'

# ----- #
# nanoc #
# ----- #

alias n='nanoc'

# ----- #
# Rails #
# ----- #

alias rt='rake test'
# Stands for rails specific test.
# Has to be used with path to the specific file to be tested.
alias rst='ruby -Itest'
alias rtv='rake test TESTOPTS="-v"'
alias ss='./script/server'

# ------- #
# Bundler #
# ------- #

alias b='bundle exec'

# --- #
# Git #
# --- #

alias gti='git'

# ----- #
# Redis #
# ----- #

alias redisstart='redis-server /opt/local/etc/redis.conf'

# ------- #
# MongoDB #
# ------- #

alias mongodbstart='mongod -f ~/etc/mongod.conf'

# -------- #
# Catapult #
# -------- #

alias ctpstart='echo "If build doesn’t work try: ctpmake" && mvn jetty:run -DskipTests -Djetty.scanIntervalSeconds=2'
# Previous version: alias ctpstart='echo "If build doesn’t work try: ctpmake" && mvn install jetty:run -DskipTests'
alias ctpmigrate='mvn initialize db-migration:migrate'
alias ctpmake='mvn clean install -DskipTests'

# ------ #
# Tomcat #
# ------ #

alias tomcat-start='/Applications/apache-tomcat-6.0.20/bin/startup.sh'
alias tomcat-stop='/Applications/apache-tomcat-6.0.20/bin/shutdown.sh'

# ---- #
# tmux #
# ---- #

alias t='tmux'

# ----- #
# hitch #
# ----- #

if `which rbenv &> /dev/null`; then
  if `rbenv which hitch &> /dev/null`; then
    hitch() {
      command hitch "$@"
      if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
    }
    alias unhitch='hitch -u'
    alias hitched='echo $GIT_AUTHOR_NAME'
    hitch # Persist pair info between terminal instances
  fi
fi

# ------ #
# ranger #
# ------ #

alias r='ranger'

# ------ #
# Gradle #
# ------ #

alias gdl='./gradlew'

# --------- #
# Checksums #
# --------- #

alias sha256='shasum -a 256'
alias sha1='openssl sha1'

# How to check if a program exists from a Bash script?
# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v md5)" ]; then
  alias md5='openssl md5'
fi

