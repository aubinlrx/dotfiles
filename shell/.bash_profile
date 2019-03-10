#!/usr/bin/env bash

# load the shell dotfiles
DOTFILES="${HOME}/dotfiles"

load_files() {
   declare -a files=(
      $DOTFILES/shell/aliases
      $DOTFILES/shell/exports
      $DOTFILES/shell/functions
      $DOTFILES/shell/options
      $DOTFILES/shell/prompt
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
	    source ${files[$index]}
	fi
    done
}

load_files
