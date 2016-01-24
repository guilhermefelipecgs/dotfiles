#!/bin/bash

if ! which sudo &> /dev/null; then
  echo "Install sudo first"
  exit
fi

sudo su <<CONFIG
localectl set-keymap br-abnt2
localectl set-locale LANG=pt_BR.UTF-8
localectl set-x11-keymap br
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
sed -i s/#pt_BR.UTF-8/pt_BR.UTF-8/ /etc/locale.gen
locale-gen
CONFIG

# PACMAN
packages="wget vim termite git sudo cscope ctags the_silver_searcher findutils
          bash-completion gstreamer0.10-plugins udisks2 pavucontrol nethogs htop vlc
          ranger firefox firefox-i18n-pt-br ntfs-3g samba aspell dfc openssh lm_sensors
          sysstat atop iotop python-pip"
file_manager="thunar thunar-volman gvfs tumbler thunar-archive-plugin
              ffmpegthumbnailer xdg-user-dirs xarchiver"
fonts="ttf-dejavu ttf-liberation"
bluetooth="bluez blueman pulseaudio-bluetooth"
xorg="xorg-server xorg-server-utils xorg-xinit xorg-xrandr xorg-xdpyinfo xorg-xprop"
i3="i3 rofi"

sudo pacman -S --needed --noconfirm $packages $fonts $bluetooth $xorg $i3 \
$file_manager

# Create Xdg user directories
xdg-user-dirs-update

# AUR
package_query_src="https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz"
yaourt_src="https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz"
packages_aur="compton jdk ttf-font-awesome teiler-git"

## install package-query for yaourt
if ! which yaourt &> /dev/null; then
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

yaourt -S --needed --noconfirm $packages_aur

# Install i3barfodder
sudo pip install i3barfodder

# Link dotfiles
for f in *; do
  if [[ -f $f && $f != *.sh ]]; then
    ln -s $PWD/$f $HOME/.$f
  fi
done

# Link config files
for f in config/*; do
  ln -s $PWD/$f $HOME/.$f
done

echo "Done"
