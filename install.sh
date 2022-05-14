if command -v curl > /dev/null; then
  COMMAND='curl -fsSL'
else
  COMMAND='wget -O -'
fi

# Pyenv
sh -c "$($COMMAND https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer)"
