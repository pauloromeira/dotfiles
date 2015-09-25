VIM_HOME="$HOME/.vim"

# Create directories
mkdir -p "$VIM_HOME/"{autoload,local} \
  "$VIM_HOME/temp/"{undo,backup,swap,view,session}

# Download Plug Manager
PLUG_FILE="$VIM_HOME/autoload/plug.vim"
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
if command -v curl > /dev/null; then
  curl -fLo "$PLUG_FILE" "$PLUG_URL"
else
  wget -O "$PLUG_FILE" "$PLUG_URL"
fi

# Clone my own/forked plugins
# TO DO: create a function to make it cleaner
cd "$VIM_HOME/local"
git clone https://pauloromeira@github.com/pauloromeira/vim-tomorrow-theme
git clone https://pauloromeira@github.com/pauloromeira/vim-custom-snippets
git clone https://pauloromeira@github.com/pauloromeira/restore_view.vim
git clone https://pauloromeira@github.com/pauloromeira/vim-startmode
git clone https://pauloromeira@github.com/pauloromeira/tabline.vim

# Install plugins
vim +PlugInstall +qall
