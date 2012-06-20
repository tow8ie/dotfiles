build() {

  cd utils/tmux-MacOSX-pasteboard
  make reattach-to-user-namespace

  cd ../..
  cp utils/tmux-MacOSX-pasteboard/reattach-to-user-namespace _bin/

}

clean() {

  cd utils/tmux-MacOSX-pasteboard
  rm -rf reattach-to-user-namespace reattach-to-user-namespace.o msg.o

  cd ../..
  rm -rf _bin/reattach-to-user-namespace

}

if [[ $1 = '' ]]; then
  echo 'Usage: pasteboard_wrapper [build|clean]'
else
  case $1 in
    'build' ) build ;;
    'clean' ) clean ;;
  esac
fi

