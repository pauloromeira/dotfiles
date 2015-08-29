BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

# TO DO: do not install cask formulae, unless explictly asked
# TO DO: some formulae installation accept arguments
# TO DO: install brew formulae from specific versions, but warns about
#   outdated formulae
# TO DO: create hooks at the root directory to run code before/after
  # packages (e.g. for pip install, since it's the same for unix systems)
# TO DO: install textual (not in cask)
# TO DO: skip commented formulae on .brew extensions

printf 'Installing Homebrew...\n'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf '\nInstalling brew formulae...\n'
brew install $(cut -d' ' -f1 "$BASE/formulae.brew")
# printf '\nInstalling brew cask formulae... \n'
# brew cask install $(cut -d' ' -f1 "$BASE/formulae.cask.brew")

pip install virtualenv virtualenvwrapper
