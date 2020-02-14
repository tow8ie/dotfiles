# ---------------- #
# PATH calculation #
# ---------------- #

# The $pre_path_definitions and $post_path_definitions arrays have to be loaded
# for this script to work. They are located in the host specific
# 00-path-definitions.*.sh file

glu() {

# Joins strings on separate lines to one string with the character given as
# first argument.

  local IFS="$1"
  shift && echo "$*"
}

pre_paths() {
  # Converts $pre_path_definitions array to space separated string
  local _paths=`echo "${pre_path_definitions[@]/#/ }"`
  # Replaces spaces of string with colons
  glu ":" $_paths
}

post_paths() {
  # Converts $post_path_definitions array to space separated string
  local _paths=`echo "${post_path_definitions[@]/#/ }"`
  # Replaces spaces of string with colons
  glu ":" $_paths
}

repath() {

# Removes duplicate entries in $PATH (keeps the one that occurs the first
# time).
# Found at:
# http://www.commandlinefu.com/commands/view/8606/speed-up-builds-and-scripts-remove-duplicate-entries-in-path.-users-scripts-are-oftern-bad-pathapathpath-type-of-thing-cause-diplicate.
#
# Explanation of crucial part, found at:
# http://www.tek-tips.com/viewthread.cfm?qid=1585675
#
# x[$0]++ increments the value of a hash member indexed by the contents of the
# current line. So the first time a line is encountered, it will be changed
# from "undefined" (or 0 as far as awk is concerned) to 1. The second time a
# matching line is encountered, it will be increased to 2, etc. The ++ being
# appended to the variable means the increment occurs after the expression is
# evaluated. If it was ++x[$0] it would happen before the expression was
# evaluated. You'll notice there is no code in { brackets } after the
# expression. This means that awk will take the default action of printing the
# input line when the expression is "true". By placing ! in front of the
# expression, it means that the overall result is "true" when the contents of
# the hash are undefined (i.e. 0), or "false" when it contains any other value
# (i.e. an identical line has been encountered previously), and in the latter
# case, nothing is printed.

  _E=`echo "${PATH//:/$'\n'}" | awk '!x[$0]++'`
  glu ":" $_E
}

debug_path() {
  for i in $(echo $PATH | tr ":" "\n"); do echo $i; done
}

PATH="`pre_paths`:$PATH:`post_paths`"

# asdf version manager (for Node.js)
if command -v brew 1>/dev/null 2>&1; then
  if brew --prefix asdf 1>/dev/null 2>&1; then
    source "$(brew --prefix asdf)/asdf.sh"
  fi
fi

# Add rbenv's shims directory to $PATH and set up Bash autocompletion
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Add pyenv's shims directory to $PATH and set up Bash autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Add the bin subdirectory of the GOPATH to the PATH
if command -v go 1>/dev/null 2>&1; then
  PATH="${PATH}:$(go env GOPATH)/bin"
fi

PATH=`repath`
export PATH

