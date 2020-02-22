# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/$(whoami)/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# ...
# ...
# ...


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search zsh-syntax-highlighting zsh-nvm vi-mode z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias sql='atom ~/web/sql-queries.md'
alias setup='atom ~/web/setup.md'

# Git aliases
alias ga='git add'
alias gpo='git push origin'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gpul='git pull origin'

# remap rm to use trash
alias rm='trash'

# reset atom
alias resetAtom='rm /usr/local/bin/atom && ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom'

# postgres bug
alias resetPostgres='rm /usr/local/var/postgres/postmaster.pid && brew services restart postgresql'

# mix tasks
alias mixps='source .env && mix phx.server'
alias mixt='source .env && MIX_ENV=test mix coveralls.html'

# zsh
alias zshrc="atom ~/.zshrc"
alias ss='source ~/.zshrc'

alias depCommit='git log -n 1'

# check ip address for running localhost on mobile
alias currentIp="ifconfig | grep inet | grep broadcast"

# alias ohmyzsh="mate ~/.oh-my-zsh"
# export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

zle-keymap-select () {
    if [ "$TERM" = "xterm-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            # the command mode for vi
            echo -ne "\e[2 q"
        else
            # the insert mode for vi
            echo -ne "\e[4 q"
        fi
    fi
}

# iex - enable history
export ERL_AFLAGS="-kernel shell_history enabled"

# source ev2 env
# TODO: only do if we are in ev2 dir
source $HOME/ev2/.env
