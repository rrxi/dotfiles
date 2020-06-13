#!/bin/bash -e

CURRENT_DIR=$(realpath $(dirname $(readlink -f ${BASH_SOURCE[0]:-$0})))

pushd $CURRENT_DIR > /dev/null 2>&1

echo "Update modules ..."
git submodule init
git submodule update --remote --recursive

# install packages
echo
echo "Would you like to install essential packages?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    ./install-pkgs.sh
    echo
    echo "Done."
    echo
else
    echo
    echo "Done (skipped the package installation)."
    echo
fi

# backup
dotfile_backup_dir=$HOME/.dotfile.backup
echo "Backup old dotfiles to $dotfile_backup_dir"
pushd $HOME > /dev/null 2>&1
rm -rf $dotfile_backup_dir
mkdir -p $dotfile_backup_dir
for f in .gitignore_global .zshrc .vimrc .config/nvim .tmux.conf; do
    if [ -e $f -o -L $f ]; then
        mv $f $dotfile_backup_dir
    fi
done
popd > /dev/null 2>&1

# zsh
echo "Installing zinit ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
rm -f $HOME/.zshrc

#nvim
echo "Installing plug(nvim)..."
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vi
echo "Installing plug(vim)..."
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
echo "Setting up tmux term..."
tic -x $CURRENT_DIR/tmux-256color.terminfo

# git
echo "Applying git config..."
source $CURRENT_DIR/gitconfig.sh

# stow
echo "Setting up dotfiles ..."
stow git zsh nvim vim tmux -t $HOME -R

# install font
echo
echo "Would you like to install nerd font?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    ./install-fonts.sh
    echo
    echo "Done."
    echo
else
    echo
    echo "Done (skipped the nerd font installation)."
    echo
fi

popd > /dev/null 2>&1
