# Dotfiles

## Setting up a new laptop

### Mac

1. Install any software updates under System Preferences.
2. Fix modifier keys and track pad.
3. App Store Login
4. Setup Divvy (Privacy -> Accessibility)
5. Install XCode
6. Download 1Password: https://1password.com/downloads/mac


### Development

1. Sign into [GitHub](https://github.com/login)

2. Set up SSH Keys:

- [Generating a new SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Add a key](https://github.com/settings/keys)

3. Clone dotfiles

```
git clone git@github.com:julieqiu/dotfiles.git
```

4. Run `./scripts/setup_dotfiles.sh`


5. Install brew ([custom directory](https://github.com/Homebrew/brew/blob/664d0c67d5947605c914c4c56ebcfaa80cb6eca0/docs/Installation.md#untar-anywhere))

```
mkdir bin && mkdir bin/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C bin/homebrew

```

6. Install tmux

```
brew install tmux
```

7. Run `./install/cask.sh` in tmux

- [install/cask.sh](install/cask.sh)

8. Run `./install/brew.sh` in tmux

- [install/brew.sh](install/brew.sh)

* Note: brew install bash to [fix this](https://apple.stackexchange.com/questions/291287/globstar-invalid-shell-option-name-on-macos-even-with-bash-4-x)

9. Setup iTerm2

  - General -> Selection
    - Check "Application in terminal may access clipboard"
  - Profiles -> Default ->
    - Colors -> Solarized Dark
    - Text -> 16pt Menlo
    - Terminal -> Unlimited scrollback
    - Terminal -> Check silence bell

10. [Install vim-plug](https://github.com/junegunn/vim-plug#installation)

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
```

11. [Install oh-my-zsh](https://ohmyz.sh/#install)

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

12. [Install powerllevel10k](https://github.com/romkatv/powerlevel10k#manual)

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

14. [Install fzf bash](https://github.com/junegunn/fzf)

```
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

15. [Install docker app](https://docs.docker.com/docker-for-mac/install/)

### Fonts

- [Install Powerline Fonts](https://github.com/powerline/fonts)

```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

### Google Cloud

- [Install google-cloud-sdk](https://cloud.google.com/sdk/docs/install)
- [Install Cloud SQL Proxy](https://cloud.google.com/sql/docs/mysql/connect-admin-proxy#macos-64-bit)

### Protobufs

```
brew install protobuf
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

### History

- [Transfer bash/zsh history](https://askubuntu.com/questions/652305/how-can-i-transfer-my-bash-history-to-a-new-system)

```
echo $HISTFILE
# Push file
cat .bash_history.old $HISTFILE | sponge $HISTFILE
```

## Personal Laptop

- Run `install.sh/me.sh`
- [Download](https://1password.com/downloads/mac) [1Password4](https://cache.agilebits.com/dist/1P/mac4/1Password-4.4.3.zip)
- [Download Remarkable2 App](https://my.remarkable.com)

## Go version
https://go.dev/doc/manage-install

```
$ go install golang.org/dl/go1.10.7@latest
$ go1.10.7 download
```
```
ln -s $HOME/sdk/go1.10.7 $HOME/go/current
```
```
PATH=/Users/julieqiu/go/current/bin:${PATH}
```
