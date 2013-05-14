# confiugre oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias gvim='gvim --servername ${VSRV:-GVIM} --remote-tab ${1:-""}'
alias sgrep="grep --exclude='*.svn*'"
alias sdiff="svn diff --diff-cmd kdiff3"
alias gdiff="git diff --color-words --word-diff-regex=. --no-index"
alias ack=ack-grep
alias vi="vim -u NONE" # do not load vimrc - super fast
which colordiff 2>&1 > /dev/null && alias diff=colordiff
alias -g ND='*(/om[1])' # newest directory
alias -g NF='*(.om[1])' # newest file

export EDITOR=vim
export PATH=$HOME/bin:$PATH:$HOME/Apps/android-sdk-linux/platform-tools
export PAGER='less -r'
export PYTHONPATH=$PYTHONPATH:~/py-lib
serial ()
{
  test -w /dev/ttyUSB0 || sudo chmod 666 /dev/ttyUSB0;
  screen /dev/ttyUSB0 115200
}

# editing of commands
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

eval `dircolors ~/dotfiles/dircolors-solarized/dircolors.ansi-dark`

# solarized colors for grep
unset GREP_COLOR
export GREP_COLORS='01;33'

# fix colors for vim in tmux
if [ -n "$TMUX" ]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

bindkey '^R' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
DISABLE_AUTO_TITLE=true
