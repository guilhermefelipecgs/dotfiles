#!/bin/bash

sudo apt-get update
sudo apt-get install exuberant-ctags silversearcher-ag cscope -y

if [ -x "$(which npm)" ]; then
	npm install -g instant-markdown-d
else
	echo -e "\033[31mnpm not installed.\033[m"
fi

if [ ! -d "$HOME/.vim" ]; then
  mkdir "$HOME/.vim"
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir "$HOME/.vim/bundle"
fi

if [ ! -d "$HOME/.undodir" ]; then
  mkdir "$HOME/.undodir"
fi

if [ ! -d "$HOME/.config/powerline" ]; then
  mkdir "$HOME/.config/powerline"
fi

if [ -f $HOME/.config/powerline/config.json ]; then
  mv $HOME/.config/powerline/config.json $HOME/.config/powerline/config.json.bak
fi

echo "{
  \"ext\": {
    \"vim\": {
      \"colorscheme\": \"solarized\"
    }
  }
}" > $HOME/.config/powerline/config.json

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ -f "$HOME/.vimrc" ]; then
  mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi

ln -s "$PWD/vimrc" "$HOME/.vimrc"
vim +PluginInstall +qall
