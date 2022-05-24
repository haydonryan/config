#!/bin/sh
echo "Linking config files from .haydons-config"
echo "It will not overwrite any existing files"
echo "========================================"
echo ""
echo "linking .vimrc"
ln -s ~/.haydons-config/arch/.config/nvim ~/.config/nvim

