echo "creating symlinks..."

DOTFILES = "${HOME}/github/aubinlrx/dotfiles"

ln -fs ${DOTFILES}/shell/.inputrc ${HOME}/.inputrc
ln -fs ${DOTFILES}/shell/.bashrc ${HOME}/.bashrc
ln -fs ${DOTFILES}/shell/.bash_profile ${HOME}/.bash_profile
source ${HOME}/.bash_profile

# git
ln -fs ${DOFILES}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOFILES}/git/.gitignore ${HOME}/.gitignore


# vim
ln -fs ${DOTFILES}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILES}/vim/.vimrc ${HOME}/.vimrc


echo "symlinks creationg done"
