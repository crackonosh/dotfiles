#!/bin/sh

OS=$(command uname -s)
DOTFILES_FOLDER=$(dirname "$0")
echo "Found OS: $OS"
if [[ $OS == "Darwin" ]];
then
    # install brew, yabai, skhd, vscode, iterm, font, nvim, docker

    echo "Copying nvim files to '\$HOME/.config/nvim'..."
    mkdir -p $HOME/.config/nvim
    yes | command cp -r $DOTFILES_FOLDER/vim/autoload $HOME/.config/nvim
    yes | command cp -r $DOTFILES_FOLDER/vim/colors $HOME/.config/nvim
    yes | command cp $DOTFILES_FOLDER/vim/init.vim $HOME/.config/nvim
    mkdir -p $HOME/.config/nvim/bundle
    yes | command cp $DOTFILES_FOLDER/vim/bundle/README.md $HOME/.config/nvim/bundle
elif [[ $OS == "Linux" ]];
then
    if ! command -v pacman &> /dev/null
    then
        echo "I use arch, btw (and so should you), 'till then help yourself"
        exit 666
    else
        echo "\t Glory to Arch!"
    fi

    ############### NVIM
    if ! command -v nvim &> /dev/null
    then
        echo "Unable to find neovim, will try to install..."
        sudo pacman -S neovim
    else
        echo "Seems like neovim is already installed"
    fi

    echo "Copying nvim files to '\$HOME/.config/nvim'..."
    mkdir -p $HOME/.config/nvim
    yes | command cp -r $DOTFILES_FOLDER/vim/autoload $HOME/.config/nvim
    yes | command cp -r $DOTFILES_FOLDER/vim/colors $HOME/.config/nvim
    yes | command cp $DOTFILES_FOLDER/vim/init.vim $HOME/.config/nvim
    mkdir -p $HOME/.config/nvim/bundle
    yes | command cp $DOTFILES_FOLDER/vim/bundle/README.md $HOME/.config/nvim/bundle

    ############### VSCODE
    if ! command -v code &> /dev/null
    then
        echo "Seems like VSCode is not installed, i'm gonna try to install it."
        sudo pacman -S code
    fi
    echo "Copying vscode setting to '\$HOME/.config/Code/User/settings.json'..."
    mkdir -p $HOME/.config/Code/User
    yes | command cp $DOTFILES_FOLDER/vscode/settings.json $HOME/.config/Code/User
    
    pacman -Q ttf-fira-code &> /dev/null
    if [[ $? -eq 0 ]]
    then
        echo "Fira code fonts are already installed."
    else
        echo "Didn't find Fira-Code font, will try to install it."
        sudo pacman -S ttf-fira-code
    fi
else
    echo "You don't really expect me to help you with that kind of system, do you..?"
    exit 666
fi

# install oh-my-zsh