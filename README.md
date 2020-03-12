# Set up

## System

#### General
- Software update
- Download chrome, install and log in
- Download Be Focused Pro and log into Apple id
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

TODO: make `backtick` right of shift key on sculpt


#### Finder
- Default new directory to jmurphy
- Remove unwanted directories
- Set key-repeat settings:
```
defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 2
```


#### Terminal
**Homebrew:**
Download:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
TODO: what does this do?
```
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew doctor
```

BREW install process:
```
brew update                           # Fetch latest version of homebrew and formula.
brew tap caskroom/cask                # Tap the Caskroom/Cask repository from Github using HTTPS.
brew search iterm2                    # Searches all known Casks for a partial or exact match.
brew cask info iterm2                 # Displays information about the given Cask
brew cask install iterm2              # Install the given cask.
brew cleanup                          # Remove any older versions from the cellar.
```

**Iterm:**
```
brew cask install iterm2
```
Set new tab & pane to same working directory:
- cmd+, > Profiles > General
- find working directory > Advanced Configuration, click 'edit' 
- NEW WINDOW - 'home dir'; OTHERS - 'reuse previous dir';
Infinite scroll:
- cmd+, > Profiles > Terminal
- check unlimited scrollback
Command click:
- cmd+, > Profiles > Advanced
- Semantic History > Open with editor > VS CODE


**Zsh/OhMyZsh**
```
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Update `~/.zshrc` from setup file. Then:
```
brew install zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source .zshrc
```
**TODO:**
ZSH theme etc



**Github:**
Generate access token:
Settings > Developer Settings > Personal Access Tokens > Generate new > Select all repo
Attempt to clone a private GitHub repo.
Enter user_name & access token for password.

Set git defaults:
```
git config --global user.name "jmurphyweb"
git config --global user.email "jmurphy.web@gmail.com"
git config --global pager.branch false
git config --global core.commentChar $
```

**Heroku:**
```
brew tap heroku/brew && brew install heroku
heroku autocomplete
```


#### Text Editor
**VS Code:**
```
brew cask install visual-studio-code
```

```
code --install-extension vscodevim.vim
code --install-extension mjmcloug.vscode-elixir
code --install-extension jakebecker.elixir-ls
code --install-extension ericadamski.copy-relative-path

brew tap homebrew/cask-fonts
brew cask install font-fira-code
```

`settings.json`:
```
{
    "window.zoomLevel": 0,
    "editor.minimap.enabled": false,
    "editor.tabSize": 2,
    "editor.fontFamily": "Fira Code, Consolas, 'Courier New', monospace",
    "editor.fontWeight": "400",
    "editor.fontSize": 12,
    "editor.fontLigatures": true,
    "editor.formatOnPaste": true,
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "JakeBecker.elixir-ls",

    "workbench.activityBar.visible": true,
    "workbench.sideBar.location": "left",
    "html.format.indentInnerHtml": true,

    // elixir
    "elixirLS.mixEnv": "dev",
    "elixirLS.fetchDeps": false,
    "elixirLS.dialyzerEnabled": false,
    "elixirLS.suggestSpecs": false,

    // vim
    "vim.useSystemClipboard":true,
}
```



#### Databases
**Postgres**
```
brew install postrgresql
brew services start postgresql
```
`psql` - if that doesn't work, log in using the default database:
`psql -d template1`
`template1=# CREATE DATABASE jmurphy WITH OWNER jmurphy ENCODING 'UTF8';`
quit `\q` and login again `psql`

**Redis**
```
brew install redis
```
______________________

#### OTHER TOOLS:
```
nvm install node
brew install elixir
brew install trash
brew cask install slack
brew cask install sourcetree
# set up personal access key on GH
brew cask install postico
# activate license
brew cask install flux
brew cask install spectacle
brew cask install licecap
brew cask install nordvpn
brew cask install spotify
```

**Spectacle:**
- _cmd+shft+j,k,i_
- Launch at login
- Run as a background application
