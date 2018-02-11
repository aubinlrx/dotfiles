# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
if [[ $(zsh --version | awk '{print $2}') > 5.1.0 ]]; then
  ZSH_THEME="spaceship"
else
  ZSH_THEME="robbyrussell" #robbyrussel
fi
SPACESHIP_VI_MODE_SHOW=false

# Load ssh indentities with ssh-agent plugins
zstyle ':omz"plugins:ssh-agent' identities 'id_rsa_winddle' 'id_rsa_aubinlrx'

# Plugin used
plugins=(git nvm rvm ssh-agent syntax-highlighting history-substring-search)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.rvm/bin"

source $ZSH/oh-my-zsh.sh

###############
# User variable
################
export VISUAL=vim
export EDITOR=$VISUAL
export BUNDLER_EDITOR=$VISUAL

#########
# History
#########
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

#########
# KEYBIDINGS
#########
# give us access to ^Q
stty -ixon

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit

#########
# OPTIONS
#########

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] wherever you want
unsetopt nomatch

# Add NVM to PATH for scripting
source ~/.nvm/nvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init- --no-rehash)"
fi

# mkdir .git/safe in the root of the respositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
