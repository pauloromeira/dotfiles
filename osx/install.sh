local BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

# TO DO: install brew formulae from specific versions, but warns about
#   outdated formulae
# TO DO: setup python and virtualenv(wrapper) or create another install.sh
#   on the root if the process is the same for ubuntu.
# TO DO: install textual (not in cask)
# TO DO: install Xcode
# TO DO: skip commentted formulas on .brew extensions
# TO DO: install fzf (maybe in the root directory of dotfiles (for osx and ubuntu)

printf 'Installing Homebrew...\n'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf '\nInstalling brew formulae...\n'
brew install $(cut -d' ' -f1 "$BASE/formulae.brew")
printf '\nInstalling brew cask formulae... \n'
brew cask install $(cut -d' ' -f1 "$BASE/formulae.cask.brew")
