# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh search setup
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

# Source Keys and Aliases
source ~/.bash_profile
source ~/.bashrc

# Export
export PATH=/Library/PostgreSQL/9.3/bin:$PATH
export KETTIMEOUT=1
export EDITOR="vim"
export VISUAL="vim"
export LSCOLORS="exfxcxdxbxegedabagacad"
export PGHOST=localhost
export ENVIRONMENT="dev"
export POSTGRES_PASSWORD="12341234"
export GOPATH="/Users/julie/code/branded/go:$HOME/code/go:/usr/local/Cellar/go/1.6.2/libexec"

# Source iterm2 login
autoload run-help
HELPDIR=/usr/local/share/zsh/help

zmodload zsh/terminfo

# bind UP and DOWN arrow keys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Vim Bindings
bindkey '^I' expand-or-complete-with-dots
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey -v
bindkey -e
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N expand-or-complete-with-dots
zle -N down-line-or-beginning-search

unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}

stty erase '^?'
stty stop undef
stty ixany
stty ixoff -ixon
