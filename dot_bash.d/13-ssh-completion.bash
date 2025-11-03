# Quick and dirty hack to autocomplete SSH host
# @see http://hints.macworld.com/article.php?story=20100113142633883

if [[ -f $HOME/.ssh/config ]]
then
  complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh
fi

