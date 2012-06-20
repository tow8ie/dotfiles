#! /bin/bash

reset_globals() {
  global_create_links='no'
  global_force_create_links='no'
}

link_linkable_files() {
  local dotfiles_dir=$1

  for filename in `list_linkable_files $dotfiles_dir`; do
    link_linkable_file $dotfiles_dir $filename
  done
}

list_linkable_files() {
  local dotfiles_dir=$1

  find $dotfiles_dir -depth 1 -name "_*" -exec basename {} \;
}

create_link() {

  local link_source=$1
  local link_target=$2

  ln -s $link_target $link_source

}

force_create_link() {

  local link_source=$1
  local link_target=$2

  ln -fs $link_target $link_source

}

ask_create_link() {

  local link_source=$1
  local link_target=$2

  echo -n "Create $link_source?: [ynaq] "
  read answer
  case $answer in
    'y' ) create_link $link_source $link_target ;;
    'a' ) global_create_links='yes'
          create_link $link_source $link_target ;;
    'q' ) exit ;;
  esac

}

ask_force_create_link() {

  local link_source=$1
  local link_target=$2

  echo -n "Overwrite $link_source?: [ynaq] "
  read answer
  case $answer in
    'y' ) force_create_link $link_source $link_target ;;
    'a' ) global_force_create_links='yes'
          force_create_link $link_source $link_target ;;
    'q' ) exit ;;
  esac

}

link_linkable_file() {

  local directory=$1
  local filename=$2
  shift 2
  local arguments="$@"

  local dotprefixed_filename=".${filename:1}"
  local link_target="`pwd`/$directory/$filename"
  local link_source="$HOME/$dotprefixed_filename"

  if `file_exists $link_source`
  then

    if `is_not_a_link $link_source` || ! `points_to_file $link_source $link_target`
    then
      if `overwrite_is_forced $arguments`; then
        force_create_link $link_source $link_target
      else
        ask_force_create_link $link_source $link_target
      fi
    fi

  else

    if `new_link_creation_is_forced $arguments`; then
      create_link $link_source $link_target
    else
      ask_create_link $link_source $link_target
    fi

  fi

}

# ---------- #
# Predicates #
# ---------- #

new_link_creation_is_forced() {
  local arguments=$1

  if `matching '\-\-force\-new\-link\-creation' $arguments` || [[ $global_create_links = 'yes' ]]; then
    return 0
  else
    return 1
  fi
}

overwrite_is_forced() {
  local arguments=$1

  if `matching '\-\-force\-overwrite' $arguments` || [[ $global_force_create_links = 'yes' ]]; then
    return 0
  else
    return 1
  fi
}

file_exists() {
  local file=$1

  if [[ -f $file || -e $file || -L $file ]]; then
    return 0
  else
    return 1
  fi
}

is_not_a_link() {
  local file=$1

  if [[ ! -L $file ]]; then
    return 0
  else
    return 1
  fi
}

points_to_file() {
  local link=$1
  local expected_target=$2

  local link_id=`ls -iL $link 2> /dev/null | cut -d ' ' -f 1`
  local expected_target_id=`ls -iL $expected_target | cut -d ' ' -f 1`

  if [[ $link_id = $expected_target_id ]]; then
    return 0
  else
    return 1
  fi
}

matching() {
  local regexp=$1
  local string=$2

  if `echo "$2" | grep "$1" 1>/dev/null 2>&1`
  then
    return 0
  else
    return 1
  fi
}

# ------------ #
# main routine #
# ------------ #

main() {
  local dotfiles_dir=$1

  reset_globals
  link_linkable_files $dotfiles_dir
}

if [[ $1 != '' ]]; then
  main $1
else
  echo "Usage: install.sh path/to/dotfiles/dir"
fi

