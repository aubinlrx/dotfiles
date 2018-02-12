# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
if [[ $(zsh --version | awk '{print $2}') > 5.1.0 ]]; then
  ZSH_THEME="spaceship"
else
  ZSH_THEME="robbyrussell" #robbyrussell
fi
SPACESHIP_VI_MODE_SHOW=false

# Load ssh identities with ssh-agent plugins
zstyle ':omz:plugins:ssh-agent' identities 'id_rsa_winddle' 'id_rsa_aubinlrx'

# Dir colors
eval `dircolors ~/.dir_colors/dircolors`

# Plugins used
plugins=(git nvm rvm ssh-agent syntax-highlighting history-substring-search)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.rvm/bin"

source $ZSH/oh-my-zsh.sh

source ~/.nvm/nvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
