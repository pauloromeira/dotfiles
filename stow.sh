#!/bin/bash

OS_ID=$(cat /etc/os-release  | grep -Poh "^ID=\K.*")

stow --no-folding --adopt --verbose --ignore='^@.*' -t $HOME */

for dir in */@$OS_ID; do
  stow --no-folding --adopt --verbose -d ${dir%/*} -t $HOME @$OS_ID
done
