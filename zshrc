if (( $+commands[brew] )); then
  if brew ls | grep zplug &> /dev/null; then

    # If zplug is installed via Homebrew on macOS.

    export ZPLUG_HOME="`brew --prefix`/opt/zplug"
    source $ZPLUG_HOME/init.zsh

    # My local zshell files that should be sourced.
    zplug "~/.shell.d", from:local, use:"*.zsh"

    # geometry is a minimalistic, fully customizable zsh prompt theme.
    # zplug "frmendes/geometry"

    # A hyperminimal zsh prompt.
    # zplug 'tylerreckart/hyperzsh', as:theme

    zplug "plugins/colored-man-pages", from:oh-my-zsh

    # Tracks your most used directories, based on 'frecency'.
    zplug "rupa/z", use:"z.sh"

    # Fish-like fast/unobtrusive autosuggestions for zsh. It suggests commands
    # as you type, based on command history.
    zplug "`brew --prefix`/share/zsh-autosuggestions", from:local, use:"zsh-autosuggestions.zsh"

    # Fish shell-like like syntax highlighting for Zsh.
    # This package provides syntax highlighing for the shell zsh. It enables
    # highlighing of commands whilst they are typed at a zsh prompt into an
    # interactive terminal. This helps in reviewing commands before running
    # them, particularly in catching syntax errors.
    #
    # NOTE THAT ZSH-SYNTAX-HIGHLIGHTING MUST BE THE LAST PLUGIN SOURCED!
    #
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    # Install plugins if there are plugins that have not been installed.
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Source plugins and add commands to $PATH.
    zplug load --verbose

    # Configuration for autosuggestions.
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
    bindkey '^ ' autosuggest-accept

  fi
fi

