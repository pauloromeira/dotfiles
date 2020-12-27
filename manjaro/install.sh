BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)
ROOT=$(dirname "$BASE")

source "$ROOT/utils.sh"

info 'Linking system files...'
sudo ln -s \
  "$BASE/config/10-keyboard.conf" \
  "/usr/share/X11/xorg.conf.d/10-keyboard.conf" &&
  success 'linked "10-keyboard.conf". Login again for the changes to take effect'

info 'Linking keyboard shortcuts...'
ln -s "$BASE/config/xfce4-keyboard-shortcuts.xml" \
  "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" &&
  success 'linked "xfce4-keyboard-shortcuts.xml". Login again for the changes to take effect'

info 'Installing packages...'
sudo pacman --needed --noconfirm -Sy \
  cmake \
  ctags \
  curl \
  gcc \
  git \
  make \
  ranger \
  sqlite \
  the_silver_searcher \
  tmux \
  tree \
  unrar \
  vim \
  xclip \
  && echo "finish"
