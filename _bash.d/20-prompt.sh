alias git_prompt="__git_ps1 ' [%s]'"

# The following prompt functions have to be wrapped in a function to be called
# on every read access of the PS1.

# This is for a nice rvm prompt hint
rvm_prompt() {
  if [ -f ~/.rvm/bin/rvm-prompt ]; then
    rvm_status=`~/.rvm/bin/rvm-prompt`
    if [ -n "${rvm_status}" ]; then
      echo -n " [$rvm_status]"
    else
      echo ''
    fi
  else
    echo ''
  fi
}

# This is for a nice rbenv prompt hint
rbenv_prompt() {
  if which rbenv > /dev/null; then
    rbenv_status=`rbenv version-name`
    if [ -n "${rbenv_status}" ]; then
      echo -n " [$rbenv_status]"
    else
      echo ''
    fi
  else
    echo ''
  fi
}

hitch_prompt() {
  if [[ -n "${GIT_AUTHOR_NAME}" ]]; then
    echo " [hitch: ${GIT_AUTHOR_NAME}]"
  else
    echo ''
  fi
}

error_prompt() {
  exit_code=$tow8ie_exit_code
  if [ $exit_code -ne 0 ]; then
    echo -n " [Error: $exit_code]"
  fi
}

# Wrap colors in \[$COLOR_NAME\]
# Wrap commands in \$(command_name)

PROMPT_COMMAND='tow8ie_exit_code=$?'
PS1="\n\h: \w \[$GREEN\] \n\[$RED\]\u \[$GREEN\](\j)\$(rbenv_prompt)\$(rvm_prompt)\$(hitch_prompt)\$(git_prompt)\[$ERED\]\$(error_prompt) →\[$NO_COLOR\] "

