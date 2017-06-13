BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
ROOT=$(dirname "$BASE")

source "$ROOT/utils.sh"

# TO DO: install: alols/xcape (github), 
    # gnome-tweak-tool (try to use xmodmap)

# Swap ctrl and caps
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"


info 'Updating apt-get packages...'
sudo apt-get update

info 'Installing apt-get packages...'
packages_batch "sudo apt-get" "-y install"

# TODO (romeira): install virtualenv && virtualenvwrapper locally {06/12/15 05:14}
# info 'Installing python packages...'
# packages_batch pip install
