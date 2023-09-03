if [ -x "$(command -v aws_completer)" ]; then
  aws_completer_path=`which aws_completer`
  complete -C "$aws_completer_path" aws
fi

