
source $HOME/.antigen.zsh

antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle autojump
antigen bundle fancy-ctrl-z
antigen bundle catimg
antigen bundle command-not-found
antigen bundle zsh-navigation-tools

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions


# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply

alias tmux="tmux -2"
alias grepc="grep --exclude={'cscope*','*tags*','*test*.*','*.o','*.so','*.patch','.*.cmd','*.ko','*.img'} --exclude-dir={out}"

[ -f ~/.zshrc_export ] && source ~/.zshrc_export

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

autoload bashcompinit
bashcompinit
autoload -U compinit && compinit -u

export PATH=$PATH:$HOME/.local/bin

