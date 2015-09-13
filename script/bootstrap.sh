#!/bin/bash

SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
TARGET=~

function create_link_force {
  ln -sf "$SOURCE/$1" "$TARGET/$2"
}

function update_submodules {
  cd "$SOURCE"
  git submodule sync
  git submodule update --init --recursive
}

update_submodules

if [[ $OSTYPE == 'msys' ]]; then
  echo "Coping configure files."
  cp -r "$SOURCE/vim/.vim" "$TARGET/.vim"
  cp "$SOURCE/vim/.vimrc" "$TARGET/_vimrc"
  cp "$SOURCE/git/.gitconfig" "$TARGET/.gitconfig"
else
  create_link_force vim/.vim .vim
  create_link_force vim/.vimrc .vimrc
  create_link_force git/.gitconfig .gitconfig
fi

if [[ $OSTYPE == 'linux-gnu' ]]; then
  # set solarized-color in xfce4 terminal
  cp submodules/xfce4-terminal-colors-solarized/dark/terminalrc ~/.config/xfce4/terminal/terminalrc
fi
