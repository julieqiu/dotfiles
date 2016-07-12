source ~/.bash_profile

# Go Path
export PATH=$PATH:$HOME/code/go/bin
export PATH=$HOME/code/arcanist/bin:$PATH
source /Users/julie/zsh-history-substring-search/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source iterm2 login
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Secrets
source ~/.SECRET


# Vim Bindings
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
zle -N expand-or-complete-with-dots
export KETTIMEOUT=1
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

# Go
export EDITOR="vim"
export VISUAL="vim"
export LSCOLORS="exfxcxdxbxegedabagacad"

export PGHOST=localhost
export ENVIRONMENT="dev"

export movefile="for filename in *.jpg; do mv "$filename" "prefix_$filename"; done;"
export POSTGRES_PASSWORD="12341234"

alias ll="ls -lah"
alias la="ls -A"
alias c='clear'
alias ag='ag --path-to-agignore=~/.agignore'

alias desktop='cd ~/Desktop'

alias vi='mvim -v'
alias vim='mvim -v'
alias szsh='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias vzsh='vim ~/.zshrc'

alias code="cd ~/code"
alias b="cd ~/code/branded"
alias bios="cd ~/code/branded/ios"
alias bjs="cd ~/code/branded/js"
alias bgo="cd ~/code/branded/go/src/jello"
alias jello="cd ~/code/branded/go/src/jello"
alias bgom="cd ~/code/branded/go/src/jello/models"
alias bops="cd ~/code/branded/ops"
alias bpy="cd ~/code/branded/python"
alias btools="cd ~/code/branded/tools"

alias jl="cd ~/code/branded/go/src/jello"
alias jlm="cd ~/code/branded/go/src/jello/models"

alias migr='~/code/branded/tools/migrate_dev.sh'

alias gs="git status"
alias ga="git add"
alias gaa="git add -u"
alias gm="git commit"
alias gmm="git commit -m"
alias gma="git commit --amend"
alias gf="git fetch"
alias gr="git rebase"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias grh="git reset HEAD~"
alias grom="git rebase origin/master"
alias gp="git push"
alias gpo="git push origin"
alias gpof="git push origin -f"
alias gb="git branch"
alias gc="git checkout"
alias gcp="git cherry-pick"
alias gpull='git pull; git remote prune origin; migr;'


alias vinstall="vim +PluginInstall +qall"
bindkey -e

alias ad="arc diff --nounit"
alias al="git fetch; git rebase origin/master; arc land"
alias adu="arc diff --update --nounit"
alias adm="arc diff --base git:origin/master"
alias psqlbd="psql branded_dev"
alias psqlbt="psql branded_test"
alias psqled="psql echub_dev"
alias psqlet="psql echub_test"

# Database aliases
alias br4real="~/code/branded/tools/read_only_db.sh branded"
alias ech4real="~/code/branded/tools/read_only_db.sh echub"
alias br4realw="~/code/branded/tools/psql_remote_db.sh service 4real-vfe"
alias ech4realw="~/code/branded/tools/psql_remote_db.sh service 4real-echub"
alias brdemo="~/code/branded/tools/psql_remote_db.sh service demo-sfe"
alias echdemo="~/code/branded/tools/psql_remote_db.sh service demo-echub"
alias brdev="~/code/branded/tools/psql_remote_db.sh service dev-vfe"
alias echdev="~/code/branded/tools/psql_remote_db.sh service dev-echub"
alias redshift='PGPASSWORD=$DB_REDSHIFT_PASSWORD psql -h spring.cminumodijif.us-east-1.redshift.amazonaws.com -U $DB_REDSHIFT_USER -p5439 for_real'

alias fixpsql="/usr/local/opt/postgresql93/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log"
alias fixpsql2="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log restart"

# Go Test Aliases
alias gog="go get"
alias gor="go run"
alias got="go test -v"
alias gotjm="go test jello/models -v"
alias gotr="go test -run -v"

# Spring Server aliases
alias sfe="$HOME/code/branded/tools/run_sfe.sh"
alias vfe="$HOME/code/branded/tools/run_vfe.sh"
alias xfe="$HOME/code/branded/tools/run_xfe.sh"
alias echub="$HOME/code/branded/tools/run_echub.sh"
alias brwork="go run go/src/jello/branded_worker/branded_worker.go"
alias echwork="go run go/src/jello/integrations/echub_worker/echub_worker.go"

# Remove swp files
alias rmswp='find . -name ".*.swp" -type f -delete; find . -name "*~" -type f -delete'
# Remove tmp files
alias rmtmp='find . -name "tmp*.txt" -type f -delete; find . -name "*~" -type f -delete'

# Regold
function regold {
        pushd ~/code/branded/
        tools/regold.sh jello/vfe/sapi -test.run=$1
        popd
}

zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down
