#!/bin/sh

OS=$(command uname -s)
DOTFILES_FOLDER=$(dirname "$0")
if [[ $OS == "Darwin" ]];
then
    # install brew, yabai, skhd, vscode, iterm, font, nvim
    echo 'Diewin'

    mkdir $HOME/.config/nvim
    yes | cp -r $DOTFILES_FOLDER/vim/autoload $HOME/.config/nvim
    yes | cp -r $DOTFILES_FOLDER/vim/colors $HOME/.config/nvim
    yes | cp -r $DOTFILES_FOLDER/vim/init.vim $HOME/.config/nvim
    mkdir $HOME/.config/nvim/bundle
    yes | cp -r $DOTFILES_FOLDER/vim/bundle/README.md $HOME/.config/nvim/bundle
elif [[ $OS == "Linux" ]];
then
    if ! command -v pacman &> /dev/null
    then
        echo 'I use arch, btw. (and so should you)'
        exit 666
    fi
    # install nvim
    sudo pacman -S nvim
else
    echo "You don't really expect me to help you with that kind of system, do you..?"
    exit 666
fi

# install oh-my-zsh