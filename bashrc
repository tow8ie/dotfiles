# Meant for profiling Bash startup:
# @see: https://stackoverflow.com/a/5015179
#
# PS4='+ $EPOCHREALTIME\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

for script in `ls $HOME/.bash.d/*.{sh,bash} | sort`; do
  if [[ -r $script ]]; then
    source $script
  fi
done

# Meant for profiling Bash startup:
# @see: https://stackoverflow.com/a/5015179
#
# set +x
# exec 2>&3 3>&-

