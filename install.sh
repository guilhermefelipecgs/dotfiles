#!/bin/bash

if [ ! -d "$HOME/.vim" ]; then
  mkdir "$HOME/.vim"
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir "$HOME/.vim/bundle"
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s "$PWD/vimrc" "$HOME/.vimrc"
vim +PluginInstall +qall

