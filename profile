DOT=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

# Aliases
alias l='ls -lGh'
alias la='l -A'
alias py='python'
alias ipy='ipython'
alias peekd='dirs -l +1' # Complement to pushd and popd (see without popping)
alias vi='vim'
alias v='vim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias yt-mp3='youtube-dl -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias rsync-cp='rsync -avhz --progress'
alias rsync-mv='rsync-cp --remove-source-files'
alias rsync-no='rsync-mv --ignore-existing'
alias ds='du -s .[!.]* * | sort -rn | cut -f2 | tr "\n" "\0" | xargs -0 du -hsc'
alias sudo='sudo ' # Allows running sudo with aliases
alias today='date "+%Y-%m-%d"'
alias week='~/Estudos/horas/hours.py'
alias taill='tail -f $(ls -p | grep -v / | sort | tail -1)'
alias cpwd='pwd | xsel -ib' # Copy pwd
alias rmpyc='find . -name \*.pyc -delete'
alias docker-prune-all='docker container prune -f && docker image prune -f && docker volume prune -f && docker network prune'

# Fuzzy finder (https://github.com/junegunn/fzf)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Remove duplicates from bash history
export HISTCONTROL=ignoreboth:erasedups

# Set tmux editor
export EDITOR=vim

if [ -d "$DOT/bin" ] ; then
  PATH="$DOT/bin:$PATH"
fi

if [ -d "$DOT_OS/bin" ] ; then
  PATH="$DOT_OS/bin:$PATH"
fi

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Pyenv / Pyenv-virtualenv autocompletion
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Pipenv
# eval "$(pipenv --completion)"

# GOPATH
export GOPATH="$HOME/.go"
PATH="$GOPATH/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH
