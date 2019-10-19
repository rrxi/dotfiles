sudo apt update
sudo apt install nodejs neovim git tig autojump ripgrep zsh curl exuberant-ctags meld ghex
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
