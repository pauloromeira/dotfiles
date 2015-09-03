BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

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


# TO DO: create a layer of abstraction to run package management installations
  # e.g. search for .brew.packman files and install requirements list with brew
  # (maybe this can be a new software!)
packages_batch() {
  manager="$1"
  command="$2"

  while read -r pkg; do
    echo "$pkg"
    "$manager" "$command" "$pkg"
  done < "$BASE/packages/${manager// /.}.packages"
}

printf 'Installing Homebrew...\n'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

printf '\nInstalling brew formulae...\n'
packages_batch brew install

# printf '\nInstalling brew cask formulae... \n'
# packages_batch "brew cask" install

printf '\nInstalling python packages...\n'
packages_batch pip install

printf '\nInstalling lua packages...\n'
packages_batch luarocks install
