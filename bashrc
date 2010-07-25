# This was prompted to be installed by the cdargs port
if [ -f /opt/local/etc/profile.d/cdargs-bash.sh ];
then
  source /opt/local/etc/profile.d/cdargs-bash.sh
fi

. ~/.bash/env
. ~/.bash/completions
. ~/.bash/config
. ~/.bash/aliases
