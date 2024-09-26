alias .......='cd ../../../../../..'
alias ......='cd ../../../../..'
alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ds='du -s .[!.]* * | sort -rn | cut -f2 | tr "\n" "\0" | xargs -0 du -hsc'
alias http-server='python3 -m http.server'
alias ip-public='curl ifconfig.co'
alias ipy='ipython'
alias json-format='python3 -m json.tool'
alias l='ls -lGh'
alias la='l -A'
alias open='xdg-open'
alias peekd='dirs -l +1' # Complement to pushd and popd (see without popping)
alias py='python'
alias rmpyc='find . \( -name \*.pyc -o -name __pycache__ \) -delete'
alias rsync-cp='rsync -avh --progress'
alias rsync-mv='rsync-cp --remove-source-files'
alias sudo='sudo ' # Allows running sudo with aliases
alias t='tmux'
alias taill='tail -f $(ls -p | grep -v / | sort | tail -1)'
alias today='date "+%Y-%m-%d"'
alias v='vim'
alias vi='vim'
alias yt-mp3='yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias eject-device="udisksctl power-off -b"
alias wg-import='nmcli connection import type wireguard file'

# ----------------------------- Docker ------------------------------ #
alias docker-aws-cli='docker run --network host --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:latest'
alias docker-dive="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest"
alias docker-prune-all='docker container prune -f && docker image prune -f && docker volume prune -f && docker builder prune -f && docker network prune'
alias docker-rclone='docker run --rm -it --volume ~/.config/rclone:/config/rclone -p 53682:53682 --user $(id -u):$(id -g) rclone/rclone'

alias mqtt_sub='docker run --rm eclipse-mosquitto mosquitto_sub'
alias mqtt_pub='docker run --rm eclipse-mosquitto mosquitto_pub'
