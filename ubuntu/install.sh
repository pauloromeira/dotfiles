BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
ROOT=$(dirname "$BASE")

source "$ROOT/utils.sh"

# Swap ctrl and caps
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"

# Install packages
info 'Adding PPAs...'
sudo add-apt-repository ppa:jonathonf/vim
sudo add-apt-repository ppa:neovim-ppa/stable

info 'Updating apt-get packages...'
sudo apt-get update

info 'Installing apt-get packages...'
packages_batch "sudo apt-get" "-y install"

# Cleanup
sudo apt-get -y autoclean
sudo apt-get -y autoremove
