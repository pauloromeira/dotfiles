BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
ROOT=$(dirname "$BASE")

source "$ROOT/utils.sh"

# TO DO: install virtualenv/wrapper (maybe in root directory via hook)
# TO DO: install: cmake, alols/xcape (github), 
    # gnome-tweak-tool (try to use xmodmap)

# TO DO: Configure caps lock:
# 1. swap caps and ctrl with gnome-tweak-tool or any other tool
# xcape -e '#66=Escape' # if gnome-tweak-tool
# xcape -e 'Control_L=Escape' # else

info 'Updating apt-get packages...'
sudo apt-get update


info 'Installing apt-get packages...'
packages_batch "sudo apt-get" install

# Install N
curl -L http://git.io/n-install | bash

# Install NVM (alternative to N)
# curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
