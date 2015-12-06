BASE=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

source "$BASE/utils.sh"

####################
#  Gathering Info  #
####################

# TO DO: create options passed by arguments (essential, basic, full, etc)
  # those options can be set in a config file (e.g. essential=(dot, os, vim))
# TO DO: argument to see an output preview (don't do anything)
# TO DO: generate log

EXEC=true # Set to false to see an output preview (don't execute)
DOT="$BASE"
case "$(uname -a)" in
  *[Dd]arwin* ) OS="osx" ;;
  *[Uu]buntu* ) OS="ubuntu" ;;
  * )
    user "unknown operating system. use configurations from:\n\
         [o]sx, [u]buntu, [s]kip, [a]bort: "
    read -n 1 action
    printf "\n"
    case "$action" in
      o ) OS="osx" ;;
      u ) OS="ubuntu" ;;
      s ) OS= ;;
      a ) warning "bootstrap aborted"; exit ;;
      * ) fail "no operating system was setted" ;;
    esac
    ;;
esac

# Packages represent folders that contains files/dirs
# to symlink and/or install.sh files to execute.
# TO DO: dinamically construct packages array
# TO DO: optionally pass specific packages by argument
# TO DO: allow subpackages
PACKAGES=(vim)

# set -e

###################
#  Link & Install #
###################

link_files() {
  info "linking files from $1"
  for src in $(find -H "$1" -maxdepth 1 -name '*.symlink'); do
    dst="$HOME/.$(basename "${src%.*}")"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" -ef "$src" ]; then
      skip "skipped $dst"
      continue
    fi

    # TO DO: attach a date+count to the backup file
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
    $EXEC && "$1/install.sh"
    success "done $1/install.sh"
  fi
}

boot_package() {
  local package="$1"
  group "$(basename "$package")"
  if [ "${package:0:1}" != "/" ]; then
    package="$BASE/$package"
  fi
  link_files "$package"
  run_installation "$package"
}

printf 'bootstrapping...\n'

boot_package "$DOT"
[ -n "$OS" ] && boot_package "$OS"

for package in ${PACKAGES[@]}; do
  boot_package "$package"
done

# Clear installation garbage
pushd "$BASE"
git checkout -f
popd

printf '\ndone.\n'
