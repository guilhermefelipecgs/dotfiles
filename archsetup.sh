#!/bin/bash

sudo su <<CONFIG
localectl set-keymap br-abnt2
localectl set-locale LANG=pt_BR.UTF-8
localectl set-x11-keymap br
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
sed -i s/#pt_BR.UTF-8/pt_BR.UTF-8/ /etc/locale.gen
locale-gen
CONFIG

package_query_src="https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz"
yaourt_src="https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz"

if ! which yaourt &> /dev/null; then
  # install package-query for yaourt
  curl $package_query_src > package-query.tar.gz
  tar xf package-query.tar.gz
  rm package-query.tar.gz
  cd package-query
  makepkg -sir --noconfirm
  cd ..
  rm -rf package-query

  # install yaourt
  curl $yaourt_src > yaourt.tar.gz
  tar xf yaourt.tar.gz
  rm yaourt.tar.gz
  cd yaourt
  makepkg -sir --noconfirm
  cd ..
  rm -rf yaourt
fi

yaourt -S --needed --noconfirm $(< packages.txt)

# Create Xdg user directories
xdg-user-dirs-update

# Link dotfiles
for f in *; do
  if [[ -f $f && $f != *.sh ]]; then
    ln -sf $PWD/$f $HOME/.$f
  fi
done

# Link config files
for dir in config/*; do
  for file in $dir/*; do
    mkdir -p $HOME/.$dir
    ln -sf $PWD/$file $HOME/.$file
  done
done

echo "Done"
