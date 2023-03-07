#!/bin/sh

OS=$(command uname -s)
DOTFILES_FOLDER=$(dirname "$0")

echo "Found OS: $OS"

if [[ $OS == "Darwin" ]];
then
    if [[ -f $HOME/Library/Application\ Support/Code/User/settings.json ]];
    then
        echo "Updating VSCode setting..."
        yes | command cp $HOME/Library/Application\ Support/Code/User/settings.json $DOTFILES_FOLDER/vscode
    else
        echo "Unable to find file '\$HOME/Library/Application\ Support/Code/User/settings.json', skipping..."
    fi

    if [[ -f $HOME/.yabairc ]] && [[ -f $HOME/.skhdrc ]];
    then
        echo "Updating yabai & skhd config..."
        yes | command cp -r $HOME/.yabairc $HOME/.skhdrc $DOTFILES_FOLDER/macOS
    else
        echo "Unable to find '.yabairc' and/or '.skhdrc' in '\$HOME' folder, skipping..."
    fi
elif [[ $OS == "Linux" ]];
then
    if [[ -f $HOME/.config/Code/User/settings.json ]];
    then
        echo "Updating VSCode setting..."
        yes | command cp $HOME/.config/Code/User/settings.json $DOTFILES_FOLDER/vscode
    else
        echo "Unable to find file '\$HOME/.config/Code/User/settings.json', skipping..."
    fi
else
    echo 'Why would you use OS like this one???'
    exit 666
fi

if [[ -d $HOME/.config/nvim ]];
then
    echo "Updating nvim folder..."
    yes | command cp -r $HOME/.config/nvim/colors $HOME/.config/nvim/autoload $HOME/.config/nvim/init.vim  $DOTFILES_FOLDER/vim
    yes | command cp $HOME/.config/nvim/bundle/README.md $DOTFILES_FOLDER/vim/bundle
else
    echo "Unable to find folder '\$HOME/.config/nvim', skipping..."
fi

if [[ -f $HOME/.zshrc ]];
then
    echo "Updating oh-my-zsh config..."
    yes | command cp -r $HOME/.zshrc $DOTFILES_FOLDER
else
    echo "Unable to find file '\$HOME/.zshrc', skipping..."
fi

exit 0

