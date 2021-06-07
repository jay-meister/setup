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
# add to favourites in Finder
```

**Dock**
- position center
- minimum size
- turn hiding on
- show on genie effect
- remove unwanted apps

**Keyboard**
- input sources British
- hide from menu bar
- preferences > keyboard > modifier keys (Caps -> Escape)

**Karabiner Elements preferences:**
- Simple modifications:
- `left_command` -> `left_option`
- `left_option` -> `left_command`
- `right_option` -> `right_command`
- `non_us_backslash` -> `grave_accent_and_tilde` (`)


#### Finder
- Default new directory to jmurphy
- Add screenshots and jmurphy as favourites
- Remove unwanted directories from favourites
- Set key-repeat settings:
```sh
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
# check defaults with: `defaults read | grep -i 'keyrepeat'`
```


#### Terminal
**Homebrew:**
Download:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew doctor
```

BREW install process:
```
brew update                           # Fetch latest version of homebrew and formula.
brew tap caskroom/cask                # Tap the Caskroom/Cask repository from Github using HTTPS.
brew search iterm2                    # Searches all known Casks for a partial or exact match.
brew info iterm2                 # Displays information about the given Cask
brew install iterm2              # Install the given cask.
brew cleanup                          # Remove any older versions from the cellar.
```

**Iterm:**
```
brew install iterm2
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
- if Silicone: Duplicate application and open with Rosetta


**Zsh/OhMyZsh**
```
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Update `~/.zshrc` from setup file. Then:
```
brew install zsh-syntax-highlighting
# currently not working with M1: git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
# node install handled later
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source .zshrc
```

**Generate SSH key:**
```
ls ~/.ssh # if empty, we generate ssh key
ssh-keygen -C YOUR~EMAIL@gmail.com -t rsa
# use default values, no passphrase
ls ~/.ssh # should contain public and private key
ssh-add ~/.ssh/id_rsa # Add your generated public key to the authentication agent
```

**Github:**
use ssh key: https://github.com/settings/keys
```
# copy public key to clipboard, then paste into github settings
pbcopy < ~/.ssh/id_rsa.pub 
```

Generate access token: https://github.com/settings/tokens Generate new > Select all repo
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
# note: Currently requires install from rosetta-enabled terminal
brew tap heroku/brew && brew install heroku
heroku autocomplete
```


#### Text Editor
**VS Code:**
```
brew install visual-studio-code
```

```
# enable press and hold
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

```
code --install-extension vscodevim.vim
code --install-extension mjmcloug.vscode-elixir
code --install-extension jakebecker.elixir-ls
code --install-extension ericadamski.copy-relative-path

brew tap homebrew/cask-fonts
brew install font-fira-code
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
brew install redisinsight
```
______________________

#### asdf:
install asdf (I used homebrew then linked in .zshrc)

```
# use asdf in .zshrc
. $(brew --prefix asdf)/asdf.sh
```
install elixir & erlang
```
asdf help

asdf plugin-add erlang
asdf list-all erlang
asdf global erlang 21.0.5
asdf list erlang

asdf plugin-add elixir
asdf list-all elixir
asdf install elixir 1.10.3
asdf global elixir 1.10.3
asdf list elixir
```

#### NVM & Nodejs
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install 15.5.0
```


#### OTHER TOOLS:



```sh
brew install trash
brew install apgdiff
brew install slack
brew install sourcetree
# set up personal access key on GH
brew install postico
# activate license from google drive
brew cask install karabiner-elements
# necessary for laptop environment
brew install rectangle
brew install nordvpn
brew install spotify

# testing
brew install clipy
brew install gifcapture
brew install toggl-track

```

**rectangle**
- `cmd shift i` full screen 
- `cmd shift h` left half 
- `cmd shift l` right half 
- `cmd shift j` bottom half 
- `cmd shift k` top half 

**screen brightness**

- _cmd+shft+j,k,i_
- Launch at login
- Run as a background application



