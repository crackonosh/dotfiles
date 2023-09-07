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

    ############### SKHD ###############
    if ! command -v skhd &> /dev/null
    then
        read -p "Unable to find skhd, do you want me to install it with homebrew? [Y/n] " -n 1 -r
        if [[ $REPLY != "" ]]
        then
            echo
        fi

        if [[ $REPLY == "y" || $REPLY == "Y" || $REPLY == "" ]]
        then
            command brew install koekeishiya/formulae/skhd
            echo "Copying .skhdrc to \$HOME folder..."
            command cp -i -v $DOTFILES_FOLDER/macOS/.skhdrc $HOME
            echo "Gonna start the skhd service with homebrew..."
            command brew services start skhd
        fi
    else
        echo "Copying .skhdrc to \$HOME folder ..."
        command cp -i -v $DOTFILES_FOLDER/macOS/.skhdrc $HOME

        read -p "Do you want me to restart the service? [Y/n] " -n 1 -r
        if [[ $REPLY != "" ]]
        then
            echo
        fi

        if [[ $REPLY == "y" || $REPLY == "Y" || $REPLY == "" ]]
        then
            command brew services restart skhd
        fi
    fi

    ############### YABAI ###############
    if ! command -v yabai &> /dev/null
    then
        read -p "Unable to find yabai, do you want me to install it with homebrew? [Y/n] " -n 1 -r
        if [[ $REPLY != "" ]]
        then
            echo
        fi

        if [[ $REPLY == "y" || $REPLY == "Y" || $REPLY == "" ]]
        then
            command brew install koekeishiya/formulae/yabai
            echo "Copying .yabairc to \$HOME folder ..."
            command cp -i -v $DOTFILES_FOLDER/macOS/.yabairc $HOME
            echo "Gonna start the yabai service with homebrew..."
            command brew services start yabai
        fi
    else
        echo "Copying .yabairc to \$HOME folder ..."
        command cp -i -v $DOTFILES_FOLDER/macOS/.yabairc $HOME

        read -p "Do you want me to restart the service? [Y/n] " -n 1 -r
        if [[ $REPLY != "" ]]
        then
            echo
        fi

        if [[ $REPLY == "y" || $REPLY == "Y" || $REPLY == "" ]]
        then
            command brew services restart yabai
        fi
    fi

    ############### NVIM ###############
    if ! command -v nvim &> /dev/null
    then
        echo "Unable to find neovim, will try to install it using homebrew..."
        command brew install neovim
    else
        echo "Neovim already installed..."
    fi

    echo "Copying nvim files to '\$HOME/.config/nvim'..."
    mkdir -p $VIM_FOLDER/bundle
    command cp -i -v -R $DOTFILES_FOLDER/vim/autoload $VIM_FOLDER
    command cp -i -v -R $DOTFILES_FOLDER/vim/colors $VIM_FOLDER
    command cp -i -v $DOTFILES_FOLDER/vim/init.vim $VIM_FOLDER
    command cp -i -v $DOTFILES_FOLDER/vim/bundle/README.md $VIM_FOLDER/bundle

    ############### NVIM PLUGINS ###############
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
        read -p "Found nvim plugin '${VIM_PLUGIN_NAMES[$i]}', do you wish to install it using git? [Y/n] " -n 1 -r
        if [[ $REPLY != "" ]]
        then
            echo
        fi

        if [[ $REPLY == "y" || $REPLY == "Y" || $REPLY == "" ]]
        then
            if ! command -v git &> /dev/null
            then
                echo "Unable to find git command. :C"
            else
                if [[ -s $VIM_FOLDER/bundle/${VIM_PLUGIN_NAMES[$i]} ]]
                then
                    read -p "It seems like the plugin already exists on this machine, do you want me to reinstall it? [y/N] " -n 1 -r
                    if [[ $REPLY != "" ]]
                    then
                        echo ""
                    fi

                    if [[ $REPLY == "y" || $REPLY == "Y" ]]
                    then
                        command rm -rf $VIM_FOLDER/bundle/${VIM_PLUGIN_NAMES[$i]}
                        command mkdir -p $VIM_FOLDER/bundle/${VIM_PLUGIN_NAMES[$i]}
                        command git clone ${VIM_PLUGIN_LINKS[$i]} $VIM_FOLDER/bundle/${VIM_PLUGIN_NAMES[$i]}
                    fi
                else
                    command mkdir -p $VIM_FOLDER/bundle/${VIM_PLUGIN_NAMES[$i]}
                    command git clone ${VIM_PLUGIN_LINKS[$i]} $VIM_FOLDER/bundle/${VIM_PLUGIN_NAMES[$i]}
                fi
            fi
        fi
    done

elif [[ $OS == "Linux" ]];
then
    if ! command -v pacman &> /dev/null
    then
        echo "I use arch, btw (and so should you), 'till then help yourself"
        exit 666
    else
        echo "Glory to Arch!"
    fi

    utils=(
        zsh
        fd
	    bat
	    wget
        curl
        fzf
        git
        lazygit
        make
        zip
        unzip
        unrar
        cargo
        gdb
        lldb
        btop
        docker
        docker-compose
        docker-buildx
        tldr
        which
    )
    read -p "Do you wish to install all missing utils? [Y/n]" -n 1 -r
    if [[ $REPLY == "y" || $REPLY == "Y"  || $REPLY == "" ]]; then
        for util in "${utils[@]}"
        do
            if pacman -Q "$util" &> /dev/null; then
                echo "Package \"$util\" was found..."
            else
                echo "Package \"$util\" is missing, gonna install it..."
                sudo pacman -S --noconfirm "$util" 
            fi
        done
    else
        for util in "${utils[@]}"
        do
            if ! pacman -Q "$util" &> /dev/null; then
                read -p "Unable to find \"$util\", do you wish to install it? [Y/n]" -n 1 -r
                if [[ $REPLY == "Y" || $REPLY == "y" || $REPLY == "" ]]; then
                    sudo pacman -S --noconfirm "$util"
                fi
            fi
        done
    fi

    ranger_libs=(
        atool
        ffmpegthumbnailer
        highlight
        imagemagick
        libcaca
        lynx
        mediainfo
        odt2txt
        poppler
        python-chardet
        ueberzug
        gpg-tui
        xplr
    )

    for rl in "${ranger_libs[@]}"; do
        if ! pacman -Q "$rl" &> /dev/null; then
            read -p "Unable to find ranger preview package \"$rl\", do you wish to install it? [Y/n]" -n 1 -r
            if [[ $REPLY == "Y" || $REPLY == "y" || $REPLY == "" ]]; then
                sudo pacman -S --noconfirm "$rl"
            else
                echo "Skipping \"$rl\" installation..."
            fi
        else
            echo "Ranger preview package \"$rl\" was already installed..."
        fi
    done

    ############### NVIM
    if ! command -v nvim &> /dev/null
    then
        echo "Unable to find neovim, will try to install..."
        sudo pacman -S neovim python-pynvim
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

    pacman -Q ttf-firacode-nerd &> /dev/null
    if [[ $? -eq 0 ]]; then
        echo "Fira code nerd fonts are already installed."
    else
        echo "Didn't find Fira-Code nerd font, will try to install it."
        sudo pacman -S ttf-firacode-nerd 
    fi
else
    echo "You don't really expect me to help you with that kind of system, do you..?"
    exit 666
fi

# install oh-my-zsh
