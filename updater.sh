#!/bin/sh

OS=$(command uname -s)
DOTFILES_FOLDER=$(dirname "$0")
if [[ $OS == "Darwin" ]];
then
    if [[ -f $HOME/Library/Application\ Support/Code/User/settings.json ]];
    then
        yes | command cp $HOME/Library/Application\ Support/Code/User/settings.json $DOTFILES_FOLDER/dotfiles/vscode
    else
        echo "Unable to find file '\$HOME/Library/Application\ Support/Code/User/settings.json', skipping..."
    fi
    if [[ -f $HOME/.yabairc ]] && [[ -f $HOME/.skhdrc ]];
    then
        yes | command cp -r $HOME/.yabairc $HOME/.skhdrc $DOTFILES_FOLDER/dotfiles
    else
        echo "Unable to find '.yabairc' and/or '.skhdrc' in '\$HOME' folder, skipping..."
    fi
elif [[ $OS == "Linux" ]];
then
    if [[ -f $HOME/.config/Code/User/settings.json ]];
    then
        yes | command cp $HOME/.config/Code/User/settings.json $DOTFILES_FOLDER/dotfiles/vscode
    else
        echo "Unable to find file '\$HOME/.config/Code/User/settings.json', skipping..."
    fi
else
    echo 'Why would you use OS like this one???'
    exit 666
fi

if [[ -d $HOME/.config/nvim ]];
then
    yes | command cp -r $HOME/.config/nvim/colors $HOME/.config/nvim/autoload $HOME/.config/nvim/init.vim  $DOTFILES_FOLDER/dotfiles/vim
    yes | command cp -r $HOME/.config/nvim/bundle/README.md $DOTFILES_FOLDER/dotfiles/vim/bundle
else
    echo "Unable to find folder '\$HOME/.config/nvim', skipping..."
fi

if [[ -f $HOME/.zshrc ]];
then
    yes | command cp -r $HOME/.zshrc $DOTFILES_FOLDER/dotfiles
else
    echo "Unable to find file '\$HOME/.zshrc', skipping..."
fi

exit 0
