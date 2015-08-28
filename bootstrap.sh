DOT=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

# TO DO: attach a date+count to the backup file
# TO DO: dinamically construct packages array
# TO DO: optionally pass specific packages by argument
# TO DO: create options passed by arguments (essential, basic, full, etc)
# TO DO: argument to see an output preview (don't do anything)
# TO DO: generate log

EXEC=true # Set to false to see an output preview (don't execute)
case "$(uname -a)" in
  *[Dd]arwin* ) OS="osx" ;;
  *[Uu]buntu* ) OS="ubuntu" ;;
  *           ) OS= ;;
esac

# Packages represent folders that contains files/dirs
# to symlink and/or install.sh files to execute.
# TO DO: add subpackages (subdirs), but let the parent packages handle
PACKAGES=($DOT $OS vim)

# set -e

#####################
#  Status Messages  #
#####################

boot() {
  printf "\r[ \033[00;35m--\033[0m ] $1\n"
}

info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

warning() {
  printf "\r  [ \033[0;33m!!\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n\n"
  exit
}

skip() {
  printf "\r  [ \033[00;30m>>\033[0m ] $1\n"
}

#############################
#  Link & Install Packages  #
#############################

link_files() {
  info "linking files from $1"
  for src in $(find -H "$1" -maxdepth 1 -name '*.symlink'); do
    dst="$HOME/.$(basename "${src%.*}")"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" -ef "$src" ]; then
      skip "skipped $dst"
      continue
    fi

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
      $EXEC && mv "$dst" "${dst}.backup"
      warning "moved $dst to ${dst}.backup"
    fi

    $EXEC && ln -s "$src" "$dst"
    success "linked $dst to $src"
  done
}

run_installation() {
  info "running installation at $1"
  if [ -f "$1/install.sh" ]; then
    $EXEC && source "$1/install.sh"
    success "done $1/install.sh"
  fi
}

printf 'bootstrapping...\n'

for package in ${PACKAGES[@]}; do
  boot "$(basename "$package")"
  if [ "$package" != "$DOT" ]; then
    package="$DOT/$package"
  fi
  link_files "$package"
  run_installation "$package"
done

printf '\ndone.'
