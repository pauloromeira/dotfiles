##################
#  Installation  #
##################

packages_batch() {
  manager="$1"
  command="$2"

  while read -r pkg; do
    echo "$pkg"
    $manager $command $pkg
  done < "$BASE/packages/${manager// /.}.packages"
}

#############
#  Messages #
#############

user () {
  printf "\r  [ \033[0;36m??\033[0m ] $1"
}

group() {
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
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  exit
}

skip() {
  printf "\r  [ \033[00;30m>>\033[0m ] $1\n"
}
