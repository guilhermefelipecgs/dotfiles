#!/bin/bash

sudo apt-get update
sudo apt-get install exuberant-ctags
sudo apt-get install silversearcher-ag

if [ ! -d "$HOME/.vim" ]; then
  mkdir "$HOME/.vim"
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir "$HOME/.vim/bundle"
fi

if [ ! -d "$HOME/.undodir" ]; then
  mkdir "$HOME/.undodir"
fi

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ -f "$HOME/.vimrc" ]; then
  mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi

ln -s "$PWD/vimrc" "$HOME/.vimrc"
vim +PluginInstall +qall

