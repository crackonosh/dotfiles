#!/bin/sh

OS=$(command uname -s)
DOTFILES_FOLDER=$(dirname "$0")
VIM_FOLDER=$HOME/.config/nvim
VIM_PLUGIN_REGEX="^\* \[([a-zA-Z0-9. -]+)\]\((.+)\)$"

echo "Found OS: $OS"
if [[ $OS == "Darwin" ]];
then
    # install brew, yabai, skhd, vscode, iterm, font, nvim, docker
    if ! command -v brew &> /dev/null
    then
      echo "Unable to find homebrew package manager, will try to install it..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      echo "Homebrew already installed..."
    fi

    if ! command -v nvim &> /dev/null
    then
      echo "Unable to find neovim, will try to install it using homebrew..."
      brew install neovim
    else
      echo "Neovim already installed..."
    fi

    echo "Copying nvim files to '\$HOME/.config/nvim'..."
    mkdir -p $VIM_FOLDER/bundle
    command cp -i -v -R $DOTFILES_FOLDER/vim/autoload $VIM_FOLDER
    command cp -i -v -R $DOTFILES_FOLDER/vim/colors $VIM_FOLDER
    command cp -i -v $DOTFILES_FOLDER/vim/init.vim $VIM_FOLDER
    command cp -i -v $DOTFILES_FOLDER/vim/bundle/README.md $VIM_FOLDER/bundle

    VIM_PLUGIN_NAMES=()
    VIM_PLUGIN_LINKS=()
    while read p;
    do
      if [[ $p =~ $VIM_PLUGIN_REGEX ]]
      then
        VIM_PLUGIN_NAMES+=("${BASH_REMATCH[1]}")
        VIM_PLUGIN_LINKS+=("${BASH_REMATCH[2]}")
      fi
    done < $VIM_FOLDER/bundle/README.md

    count=${#VIM_PLUGIN_NAMES[@]}
    for (( i=0; i<${count}; i++ ));
    do
      read -p "Found nvim plugin '${VIM_PLUGIN_NAMES[$i]}', do you wish to install it? [Y/n] " -n 1 -r
      if [[ $REPLY != "" ]] 
      then 
        echo
      fi
      if [[ $REPLY == "y" || $REPLY == "Y" || $REPLY == "" ]]
      then
        echo "yesss"
      fi
    done

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
    mkdir -p $VIM_FOLDER/bundle
    command cp -i -v -R $DOTFILES_FOLDER/vim/autoload $VIM_FOLDER
    command cp -i -v -R $DOTFILES_FOLDER/vim/colors $VIM_FOLDER
    command cp -i -v $DOTFILES_FOLDER/vim/init.vim $VIM_FOLDER
    command cp -i -v $DOTFILES_FOLDER/vim/bundle/README.md $VIM_FOLDER/bundle

    ############### VSCODE
    if ! command -v code &> /dev/null
    then
        echo "Seems like VSCode is not installed, i'm gonna try to install it."
        sudo pacman -S code
    fi
    echo "Copying vscode setting to '\$HOME/.config/Code/User/settings.json'..."
    mkdir -p $HOME/.config/Code/User
    command cp -i -v $DOTFILES_FOLDER/vscode/settings.json $HOME/.config/Code/User
    
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
