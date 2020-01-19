#!/bin/bash -ex

CURRENT_DIR=$(realpath $(dirname $(readlink -f ${BASH_SOURCE[0]:-$0})))

pushd $CURRENT_DIR > /dev/null 2>&1

git submodule init
git submodule update --remote --recursive


# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

#nvim
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vi
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
tic -x $CURRENT_DIR/tmux-256color.terminfo

# font
$CURRENT_DIR/fonts/install.sh

# git
source $CURRENT_DIR/gitconfig.sh

# stow
sudo apt update -y && apt install stow -y
# stow restore
# restore manually with the following commands
# stow git zsh nvim vim tmux -t $HOME -R

popd > /dev/null 2>&1
