# PATH
# source ~/.bash_profile
export PATH=/Library/PostgreSQL/9.3/bin:$PATH

# Source iterm2 login
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Go
export EDITOR="vim"
export VISUAL="vim"
export LSCOLORS="exfxcxdxbxegedabagacad"

export PGHOST=localhost
export ENVIRONMENT="dev"

export movefile="for filename in *.jpg; do mv "$filename" "prefix_$filename"; done;"
export POSTGRES_PASSWORD="12341234"

# GOPATH="/Users/julie/code/branded/go:$HOME/code/go:/usr/local/Cellar/go/1.6.2/libexec"
# export GOPATH="/Users/julie/code/branded/go:$HOME/code/go:/usr/local/Cellar/go/1.6.2/libexec"

alias ll="ls -lah"
alias la="ls -A"
alias c='clear'
alias ag='ag --path-to-agignore=~/.agignore'

alias desktop='cd ~/Desktop'

alias szsh='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias vzsh='vim ~/.zshrc'

# alias BGOPATH="GOPATH=$HOME/code/branded/go:$HOME/code/go:/usr/local/go/bin/go;"
# alias JGOPATH="GOPATH=$HOME/code/julie/go:$HOME/code/go:/usr/local/go/bin/go;"
# alias gobin="GOBIN=/usr/local/go/bin/go/bin"

alias code="cd ~/code"
alias j="cd ~/code/julie"
alias i="cd ~/code/julie/go/src/github.com/julieqiu/inspiration"
alias jgo="i"

alias b="cd ~/code/branded"
alias jello="cd ~/code/branded/go/src/jello"
alias bgo="jello"
alias bgom="jello; cd ./models;"
alias bios="cd ~/code/branded/ios"
alias bjs="cd ~/code/branded/js"
alias bops="cd ~/code/branded/ops"
alias bpy="cd ~/code/branded/python"
alias btools="cd ~/code/branded/tools"

alias migr='~/code/branded/tools/migrate_dev.sh'

alias gs="git status"
alias ga="git add"
alias gaa="git add -u"
alias gm="git commit"
alias gmm="git commit -m"
alias wip="gaa; git commit -m 'work in progress (not ready for review)'"

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
alias gd='git diff'

alias ff="find . | ag"

alias vinstall="vim +PluginInstall +qall"
bindkey -e

alias ad="arc diff"
alias adnu="arc diff --nounit"
alias al="git fetch; git rebase origin/master; arc land"
alias adu="arc diff --update"
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
alias gota="go test"
alias got="go test -run"
alias gotv="go test -v -run"
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
alias rmtmp='find . -name "*tmp*.txt" -type f -delete; find . -name "*~" -type f -delete'

# Regold
function regold {
        pushd ~/code/branded/
        tools/regold.sh -a
        popd
}

zmodload zsh/terminfo

# search for processes by name
alias procs="ps -ef | grep"

# play a sound
alias sound='afplay /System/Library/Sounds/Ping.aiff'

# open all config files
alias config='subl ~/.bash_profile ~/.bash_aliases ~/.work_profile ~/.work_aliases ~/.gitconfig'

# source bash profile
alias src='source ~/.bash_profile'


# url encode and decode
alias urlenc='urlencode'
alias urldec='urldecode'

# copy a safety pig to your clipboard
alias pig='safetypig'

# restart clipboard if it's being a jerk
alias restclip='launchctl stop com.apple.pboard && launchctl start com.apple.pboard'

# zsh search setup
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Fix elastic search
alias elasticsearch="b; ./tools/start_elasticsearch.sh --recreate"

# Regold
function elasticsearch2 {
    eval "$(${HOME}/code/branded/tools/run_docker_machine.sh)"
    curl -XPUT "${DOCKER_HOST_IP}:9200/products_*/_alias/products"
}

# Pipe tests into tmp files
function gott {
    name=tmp
    if [[ -e $name.txt ]] ; then
        i=1
        while [[ -e $i$name.txt ]] ; do
            let i++
        done
        name=$i$name
    fi
    gotv $1 > $name.txt
}
