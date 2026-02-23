# ---------------- #
# PATH calculation #
# ---------------- #

# The $pre_path_definitions and $post_path_definitions arrays have to be loaded
# for this script to work. They are located in the host specific
# 00-path-definitions.*.sh file

debug_path() {
  for i in $(echo $PATH | tr ":" "\n"); do echo $i; done
}

# https://unix.stackexchange.com/a/634670
pathedit() {
    [ -z "$2" ] && return 2
    PATH=$(printf ":$PATH:" | sed "s:\:$2\::\::g")
    case $1 in
    -p ) PATH=$2$PATH ;;
    -a ) PATH=$PATH$2 ;;
    -r ) ;;
    * ) return 2 ;;
    esac
    PATH=$(printf "$PATH" | tr -s :) PATH=${PATH#:} PATH=${PATH%:}
}

# Add rbenv's shims directory to $PATH and set up Bash autocompletion
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Add pyenv's shims directory to $PATH and set up Bash autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Add the bin subdirectory of the GOPATH to the PATH
if command -v go 1>/dev/null 2>&1; then
  pathedit -a "$(go env GOPATH)/bin"
fi

# Prepend paths

for (( idx=${#pre_path_definitions[@]}-1 ; idx>=0 ; idx-- )) ; do
    pathedit -p "${pre_path_definitions[idx]}"
done

# Append paths

for (( idx=${#post_path_definitions[@]}-1 ; idx>=0 ; idx-- )) ; do
    pathedit -a "${post_path_definitions[idx]}"
done

export PATH

