#!/usr/bin/env bash

# Taken from: https://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
# Does not work too well, might need some additional manual setup.

# if [[ "$(uname)" == "Darwin" && -d "/Applications/iTerm.app" ]]; then
#   echo "Configuring iTerm."
#   # Specify the preferences directory
#   defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.dotfiles/iterm2"
#   # Tell iTerm2 to use the custom preferences in the directory
#   defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
# fi

