BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
ROOT=$(dirname "$BASE")

source "$ROOT/utils.sh"

# TO DO: load karabiner settings
# TO DO: do not install cask formulae, unless explictly asked
# TO DO: some formulae installation accept arguments
# TO DO: install brew formulae from specific versions, but warns about
#   outdated formulae
# TO DO: create hooks at the root directory to run code before/after
  # packages (e.g. for pip install, since it's the same for unix systems)
# TO DO: install textual (not in cask)
# TO DO: skip commented formulae on .brew extensions
# TO DO: create a utils script to provide common functions to install scripts
  # e.g. info messages / interaction / log (maybe requirements installation)

info 'Installing Homebrew...'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

info 'Installing brew formulae...'
packages_batch brew install

# info 'Installing brew cask formulae... '
# packages_batch "brew cask" install

info 'Installing python packages...'
packages_batch pip install

info 'Installing lua packages...'
packages_batch luarocks install
