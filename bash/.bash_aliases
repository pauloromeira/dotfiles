alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias docker-prune-all='docker container prune -f && docker image prune -f && docker volume prune -f && docker network prune'
alias ds='du -s .[!.]* * | sort -rn | cut -f2 | tr "\n" "\0" | xargs -0 du -hsc'
alias full-upgrade='sudo apt update && sudo apt -y upgrade && sudo apt full-upgrade && sudo apt autoremove && sudo apt autoclean'
alias ipy='ipython'
alias l='ls -lGh'
alias la='l -A'
alias opn='xdg-open'
alias peekd='dirs -l +1' # Complement to pushd and popd (see without popping)
alias py='python'
alias rmpyc='find . -name \*.pyc -delete'
alias rsync-cp='rsync -avhz --progress'
alias rsync-mv='rsync-cp --remove-source-files'
alias rsync-no='rsync-mv --ignore-existing'
alias sudo='sudo ' # Allows running sudo with aliases
alias taill='tail -f $(ls -p | grep -v / | sort | tail -1)'
alias today='date "+%Y-%m-%d"'
alias v='vim'
alias vi='vim'
alias yt-mp3='youtube-dl -x --audio-format mp3 -o "%(title)s.%(ext)s"'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
