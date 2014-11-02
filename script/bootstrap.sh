#!/bin/bash

SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
TARGET=~

function create_link_force {
  ln -sf "$SOURCE/$1" "$TARGET/$2"
}

create_link_force vim/.vim .vim
create_link_force vim/.vimrc .vimrc
create_link_force git/.gitconfig .gitconfig
