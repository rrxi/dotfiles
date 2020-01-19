echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update
sudo apt install stow nodejs neovim git tig autojump ripgrep zsh curl exuberant-ctags meld ghex yarn
