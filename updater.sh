#!/bin/sh
yes | command cp -r ~/.vimrc ~/.zshrc ~/.config/neofetch ~/dotfiles/
git pull
git add .
git commit -m "Dotfiles sync"
git push
