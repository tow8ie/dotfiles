_bb_tasks() {
    COMPREPLY=( $(compgen -W "$(bb tasks |tail -n +3 |cut -f1 -d ' ')" -- ${COMP_WORDS[COMP_CWORD]}) );
}

if [ -x "$(command -v bb)" ]; then
  # autocomplete filenames as well
  complete -f -F _bb_tasks bb
fi

