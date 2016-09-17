#!/bin/bash

log=$HOME/archsetup.log

exec &> >(tee $log)

confirm() {
  while true; do
    read -n 1 -p "$(echo -e "\n$1 [y/N]:") " response
    case $response in
      [yY]) echo true; return 0 ;;
      [nN]|'') echo false; return 1 ;;
    esac
  done
}

mkdir_n_link() {
  dot=""
  src=$1

  if [[ $src =~ ^\. ]]; then
    dot="."
    src=${src:1}
  fi

  mkdir -p $HOME/$dot$src

  for file in $src/*; do
    if [[ -d $file ]]; then
      mkdir_n_link $dot$file
    else
      ln -sf $PWD/$file $HOME/$dot$file
    fi
  done
}

generate_locale=$(confirm "Configure keyboard/localtime/locale?")
install_packages=$(confirm "Install packages?")
update_xdg_user_dirs=$(confirm "Update XDG user dirs?")
link_dot_files=$(confirm "Install dotfiles? (This will overwrite existing dotfiles)")
install_vim_plugins=$(confirm "Install vim plugins?")
update_pkgfile=$(confirm "Update pkgfile?")

echo

$generate_locale && sudo su <<CONFIG
localectl set-keymap br-abnt2
localectl set-locale LANG=pt_BR.UTF-8
localectl set-x11-keymap br
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
sed -i s/#pt_BR.UTF-8/pt_BR.UTF-8/ /etc/locale.gen
sed -i s/#en_US.UTF-8/en_US.UTF-8/ /etc/locale.gen
locale-gen
CONFIG

if ! which yaourt &> /dev/null; then
  package_query_src="https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz"
  yaourt_src="https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz"

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

$install_packages && yaourt -S --needed --noconfirm $(< packages.txt)

# Create Xdg user directories
$update_xdg_user_dirs && xdg-user-dirs-update

mkdir -p $HOME/.undodir

if $link_dot_files; then
  echo "Linking dotfiles"
  # Link dotfiles
  for f in *; do
    if [[ -f $f && ! $f =~ \.(sh)|(txt)$ ]]; then
      ln -sf $PWD/$f $HOME/.$f
    fi
  done

  mkdir_n_link .config
  mkdir_n_link bin

fi

$install_vim_plugins &&\
  echo "Installing vim plugins" &&\
  vim +PluginInstall +qall &> /dev/null

$update_pkgfile && sudo pkgfile -u

echo "Done"
