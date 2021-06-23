# Dotfiles

## Setting up a new laptop

1. Install Brew: https://brew.sh/

```
brew install \
	bash \
	colordiff \
    coreutils \
	docker \
	docker-compose \
	fzf \
	geoip \
	golang-migrate \
	htop \
	jq \
	macvim \
	node \
	postgresql \
	python \
	ripgrep \
	tmux \
	tree \
	vim \
	watch \
	wget \
    docker \
    google-chrome \
    iterm2 \
    tableplus
```

* Install bash to [fix this](https://apple.stackexchange.com/questions/291287/globstar-invalid-shell-option-name-on-macos-even-with-bash-4-x)

2. Install iTerm2: https://iterm2.com/downloads.html

- Setup:

  - Go to profiles -> Default ->
    - Terminal -> Check silence bell
    - Text -> 16pt Menlo
    - Colors -> Solarized Dark

3. Set up SSH Keys:

- [Generating a new SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Add a key](https://github.com/settings/keys)

4. Set up ZSH
```
brew install zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting
brew install zsh-history-substring-search
```

5. Install powerllevel10k: https://github.com/romkatv/powerlevel10k

6. Symlink dotfiles
```
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/vimrc ~/.vimrc
```
