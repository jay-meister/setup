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

# use asdf:
. $(brew --prefix asdf)/asdf.sh

# Example aliases
alias setup='cd ~/code/setup && code .'

# Git aliases
alias ga='git add'
alias gpob='git push origin "$(git_current_branch)"'
alias gpobf='git push origin "$(git_current_branch)" --force-with-lease'
alias gd='git diff'
alias gcm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gpul='git pull origin'


# Zsh git 

# gst=git status
# gfa=git fetch --all --prune
# gfo=git fetch origin
# gds=git diff --staged
# ggl=git pull origin
# ggp=git push origin $(current_branch)
# gcm=git checkout master
# gcd=git checkout develop
# gcmsg=git commit -m
# gco=git checkout
# glo=git log --oneline --decorate --color
# glog=git log --oneline --decorate --color --graph

# gcsm=git commit -s -m (with signoff)

# remap rm to use trash
alias rm='trash'


# psql $(heroku config:get DATABASE_URL -a ev2-staging-pr-3080)
heroku-db() {
    if [ "$1" = "staging" ]
    then
        psql $(heroku config:get DATABASE_URL -a ev2-staging)
    else
        psql $(heroku config:get DATABASE_URL -a ev2-staging-pr-"$1")
    fi
}

# postgres bug
alias resetPostgres='rm /usr/local/var/postgres/postmaster.pid && brew services restart postgresql'

# mix tasks
alias mixps='source .env && iex -S mix phx.server'
alias mixt='source .env && MIX_ENV=test mix coveralls.html'

# zsh
alias zshrc="code ~/.zshrc"
alias zshhis="code ~/.zsh_history"
alias til="code ~/code/til/"
alias ss='source ~/.zshrc'

# git heroku deployed commit
alias depCommit='git log -n 1'

# check ip address for running localhost on mobile
alias currentIp="ifconfig | grep inet | grep broadcast"

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
if [ "${PWD##*/}" = "ev2" ]; then
    echo "sourcing $HOME/ev2/.env"
    source $HOME/ev2/.env
fi
