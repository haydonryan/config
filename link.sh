#!/bin/sh
echo "Linking config files from .haydons-config"
echo "It will not overwrite any existing files"
echo "========================================"
echo ""
echo "linking .vimrc"
ln -s ~/.haydons-config/.vimrc ~/.vimrc
echo "Linking .tmuz.conf"
ln -s ~/.haydons-config/.tmux.conf ~/.tmux.conf
echo "linking .Xmodmap"
ln -s ~/.haydons-config/.Xmodmap ~/.Xmodmap
echo "linking .bash_alias"
ln -s ~/.haydons-config/.bash_aliases ~/.bash_aliases
echo "linking .gitconfig"
ln -s ~/.haydons-config/.gitconfig ~/.gitconfig
echo "linking .bashrc"
ln -s ~/.haydons-config/.bashrc ~/.bashrc

if [ $SHELL == "/bin/ash" ]; then
  echo "linking ash profile script"
  # must be a hard link
  ln ~/.haydons-config/ish/profile /etc/profile
fi
