alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ds='du -s .[!.]* * | sort -rn | cut -f2 | tr "\n" "\0" | xargs -0 du -hsc'
alias ipy='ipython'
alias l='ls -lGh'
alias la='l -A'
alias open='xdg-open'
alias peekd='dirs -l +1' # Complement to pushd and popd (see without popping)
alias py='python'
alias rmpyc='find . \( -name \*.pyc -o -name __pycache__ \) -delete'
alias rsync-cp='rsync -avhz --progress'
alias rsync-mv='rsync-cp --remove-source-files'
alias rsync-no='rsync-mv --ignore-existing'
alias sudo='sudo ' # Allows running sudo with aliases
alias t='tmux'
alias taill='tail -f $(ls -p | grep -v / | sort | tail -1)'
alias today='date "+%Y-%m-%d"'
alias v='vim'
alias vi='vim'
alias yt-mp3='yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias json-format='python3 -m json.tool'
alias http-server='python3 -m http.server'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ----------------------------- Docker ------------------------------ #
alias docker-aws-cli='docker run --network host --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:latest'
alias docker-portainer-up='docker volume create portainer_data && docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest'
alias docker-prune-all='docker container prune -f && docker image prune -f && docker volume prune -f && docker builder prune -f && docker network prune'
