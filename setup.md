## System

#### General
- Software update
- Download chrome, install and log in
- Log into icloud
- Screenshots:
```
mkdir -p ~/screenshots/
defaults write com.apple.screencapture location ~/screenshots/ && killall SystemUIServer
```

**Dock**
- position center
- minimum size
- turn hiding on
- show on genie effect
- remove unwanted apps

**Keyboard**
- input sources British
- show keyboard in menu bar
- show keyboard viewer
- modifier keys for default keyboard (Caps -> Escape)
- modifier keys for sculpt (Caps -> Escape, Control -> Control, Option -> Command, Command -> Option)
- hide from menu bar
- todo: make `\`` right of shift key on sculpt


#### Finder
- Default new directory to jmurphy
- Remove unwanted directories
- Set key-repeat settings:
```
defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 2
```



Homebrew:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew doctor
```


Heroku:
```
brew tap heroku/brew && brew install heroku
```

ohmyzsh
useful plugins:
`plugins=(git history-substring-search zsh-syntax-highlighting zsh-nvm)`
install custom plugins into `~/.ohmyzsh/custom/plugins`: `zsh-syntax-highlighting` & `zsh-nvm`
theme:
`ZSH_THEME="random"`

atom
packages:
autocomplete-paths, open-in-browser, file-icons, linter, eslint
themes:
atom-material-ui, atom-material-syntax


postgres

`brew install postrgres
brew services start postgresql`
`psql` - if that doesn't work, log in using the default database:
`psql -d template1`
`template1=# CREATE DATABASE jmurphy WITH OWNER jmurphy ENCODING 'UTF8';`
quit `\q` and login again `psql`


redis
brew install redis

General
- Chrome
- iTerm2 _make default shell by clicking `iTerm2`_
- Flux
- Spectacle _cmd+shft+j,k,i_
- SourceTree
- Pomodoro Time
