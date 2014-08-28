#!/bin/bash

if [ ! -d "$HOME/.vim" ]; then
  mkdir "$HOME/.vim"
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir "$HOME/.vim/bundle"
fi

if [ ! -d "$HOME/.undodir" ]; then
  mkdir "$HOME/.undodir"
fi

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -s "$PWD/vimrc" "$HOME/.vimrc"
vim +PluginInstall +qall

