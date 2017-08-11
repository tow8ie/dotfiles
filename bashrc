for script in `ls $HOME/.shell.d/*.{sh,bash} | sort`; do
  if [[ -r $script ]]; then
    source $script
  fi
done

