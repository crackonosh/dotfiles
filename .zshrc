OS=$(command uname -s)
if [[ $OS == "Darwin" ]];
then
	# Path to your oh-my-zsh installation.
	export ZSH="/Users/$USER/.oh-my-zsh"
	# Add other folders that contains executables
	export PATH="/usr/local/opt/binutils/bin:$PATH"
	export PATH="/usr/local/Cellar:/usr/local/sbin:$PATH"
	export PATH="$PATH:/Users/$USER/Library/Python/2.7/bin"
	export PATH="$PATH:/Users/$USER/.composer/vendor/bin"
  export EDITOR=$(command -v nvim || command -pv vim || command -pv vi)
elif [[ $OS == "Linux" ]];
then
	# Path to your oh-my-zsh installation.
	export ZSH="/home/$USER/.oh-my-zsh"
  export EDITOR=$(command -pv nvim || command -pv vim || command -pv vi)
fi

# Set name of the theme to load.
ZSH_THEME="bira"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  web-search
  colored-man-pages
  colorize
  cp
  jump
)
if [[ $OS == "Darwin" ]];
then
  plugins+=(macos zsh-syntax-highlighting zsh-autosuggestions)
fi

source $ZSH/oh-my-zsh.sh

if [[ $OS == "Linux" ]];
then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# User configuration
#
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [[ $OS == "Darwin" ]];
then
	alias vim="vimr"
	alias freespace="echo \"Free space:\" $(diskutil info / | grep "Free Space" | awk '{print $4 $5}')"
  alias yabres='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"'
fi

alias gc='git clone'
alias gcm="git checkout main"
alias gs="git status"
alias ls="lsd"
alias cat="colorize_cat" # plugin colorize
alias ccat="command -p cat"
alias less="colorize_less" # plugin colorize
alias chead='f(){ colorize_cat "$@" | sed -n "1,10p" ; unset -f f; }; f' # this is used for supporting colored output on head command, should be used like `chead FILENAME.c`
alias ctail='f(){ colorize_cat "$@" | tail; unset -f f; }; f' # this is used for supporting colored output on tail command
