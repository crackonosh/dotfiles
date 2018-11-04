#!/bin/sh
yes | command cp -r ~/.vimrc ~/.zshrc ~/.config/neofetch ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/dotfiles/
git pull
git add .
git commit -m "Dotfiles sync"
git push
