# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerline10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hide the “user@hostname” info when you’re logged in as yourself on your #
# local machine: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
prompt_context(){}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/julie/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/julie/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/julie/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/julie/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

######################
## Aliases
######################
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

export GO111MODULE=on
export GOPATH=$HOME/go:$HOME/bin:/usr/local/opt/go/libexec

# ALIASes
alias pip=pip3
alias python=python3

### ~~~ TERMINAL TOOLS ~~~ ###
# Remove swp files
alias rmswp='find . -name ".*.swp" -type f -delete; find . -name "*~" -type f -delete'
# Remove tmp files
alias rmtmp='find . -name "*tmp*.txt" -type f -delete; find . -name "*~" -type f -delete'
# Find a file
alias ff="find . | rg"
# Shortcuts
alias ll="ls -lah"
alias la="ls -A"
alias c='clear'
alias findspace="du -shc .??* *"

### ~~~ VIM TOOLS ~~~ ###
alias vi='vim'
alias vinstall="vim +PluginInstall +qall"

### ~~~ Git Commands ~~~ ###
alias gaa="git add -u"
alias gb="git branch"
alias grn="git branch -m"
alias gc="git checkout"
alias gcp="git cherry-pick"
alias gd='git diff'
alias gf="git fetch"
alias ghist="log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias ga="git add"
alias gm="git commit"
alias gma="git commit --amend"
alias gmm="git commit -m"
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias glog="git log"
alias gpull='gf --prune; grom; git remote prune origin; migr;'
alias gr="git rebase"
alias grl="git reflog"
alias grc="git rebase --continue"
alias grh="git reset HEAD~"
alias grom="git rebase origin/master"
alias grhom="git reset --hard origin/master"
alias grs="git rebase --skip"
alias gs="git status"
alias gdeleteall="git branch | grep -v 'master' | xargs git branch -D"
alias gclean="git clean -fd"
alias wip="gaa; git commit -m 'work in progress (not ready for review)'"
alias gdeleteall="git branch | grep -v 'master' | xargs git branch -D"
alias grn="git branch -m"

### ~~~ RANDOM ~~~ ###
# search for processes by name
alias procs="ps -ef | rg"
# restart clipboard if it's being annoying
alias restclip='launchctl stop com.apple.pboard && launchctl start com.apple.pboard'

source ~/.SECRET
