#!/bin/bash

DOTFILES=$(pwd)

ln -s $DOTFILES/config ~/.config
ln -si $DOTFILES/agignore ~/.agignore
ln -si $DOTFILES/gitconfig ~/.gitconfig
ln -si $DOTFILES/profile ~/.profile
ln -si $DOTFILES/tmux.conf ~/.tmux.conf
ln -si $DOTFILES/vimrc ~/.vimrc
ln -si $DOTFILES/vimrc.bundles ~/.vimrc.bundles
