# Python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Aliases
alias ll='ls -lG'
alias la='ll -A'
alias tree='tree -C'
alias rm='rm -i'
alias py='python'
alias ipy='ipython'
alias upg='brew update && brew upgrade && brew cleanup'
alias ty='$(which python3) ~/type.py'
alias peekd='dirs -l +1'
alias vi='vim'
alias mvi='mvim'
alias ip='ifconfig|grep broadcast'
alias top='top -o cpu'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"
# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Setting PATH for Python 3.4
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

export PATH
