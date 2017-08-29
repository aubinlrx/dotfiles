# Dotfiles

# Installation

If you have trouble during the installation, please open an issue or pull requet.

Clone this repo (or your own fork!) to your home directory (cd ~)

```
$ cd ~
$ git clone https://github.com/aubinlrx/dotfiles
```

Install rcm
```
$ sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
$ sudo apt update
$ sudo apt install rcm
```

Setup vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run rcm (this command expects that you cloned your dotfiles to ~/dotfiles/)

```
$ env RCRC=$HOME/dotfiles/rcrc rcup
```

## Install Vim Plugins

Plugins are listed in `vimrc.bundles`

To install them you'll need vim-plug installed. Once vim-plug is installed.
Open vim (`$ vim`) and type `:PlugInstall`. And then restart vim. You'll need to do this for all the plugins to work

### Contributing

Did you have trouble installing this? Could I make the documentation better? Let me know @aubinlrx. Or please fork & create a pull request with your suggestions.
