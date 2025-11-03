# Completion for local babashka tasks (bb)

_bb_tasks() {
    COMPREPLY=( $(compgen -W "$(bb tasks |tail -n +3 |cut -f1 -d ' ')" -- ${COMP_WORDS[COMP_CWORD]}) );
}

if [ -x "$(command -v bb)" ]; then
  # autocomplete filenames as well
  complete -f -F _bb_tasks bb
fi

# Completion for global babashka tasks (bbb)

_bbb_tasks() {
    COMPREPLY=( $(compgen -W "$(bbb tasks |tail -n +3 |cut -f1 -d ' ')" -- ${COMP_WORDS[COMP_CWORD]}) );
}

if [ -x "$(command -v bbb)" ]; then
  # autocomplete filenames as well
  complete -f -F _bbb_tasks bbb
fi

