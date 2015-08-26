# Python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Fuzzy finder (https://github.com/junegunn/fzf)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag -la'


# Aliases
alias l='ls -lGh'
alias la='ll -A'
alias tree='tree -C'
alias rm='rm -i'
alias py='python'
alias ipy='ipython'
alias upg='brew update && brew upgrade && brew cleanup && brew cask cleanup'
alias ty='$(which python3) ~/type.py'
alias peekd='dirs -l +1' # Complement to pushd and popd (see without popping)
alias vi='vim'
alias mvi='mvim'
alias ip='ifconfig|grep broadcast'
alias top='top -o cpu'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsvirtualenv='lsvirtualenv -b' # Shortens the output
alias yt-mp3='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
alias rsync-mv='rsync -vcrzhP --remove-source-files'
alias ds='du -s .[!.]* * | sort -rn | cut -f2 | tr "\n" "\0" | xargs -0 du -hsc'
alias sudo='sudo ' # Allows run sudo with aliases

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"
# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Setting PATH for Python 3.4
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
# PostgreSQL
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:${PATH}"

export PATH
