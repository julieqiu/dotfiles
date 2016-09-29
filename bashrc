# bashrc contains all aliases

### ~~~ TERMINAL TOOLS ~~~ ###
# Remove swp files
alias rmswp='find . -name ".*.swp" -type f -delete; find . -name "*~" -type f -delete'
# Remove tmp files
alias rmtmp='find . -name "*tmp*.txt" -type f -delete; find . -name "*~" -type f -delete'
# Find a file
alias ff="find . | ag"
# Shortcuts
alias ll="ls -lah"
alias la="ls -A"
alias c='clear'
alias ag='ag --path-to-agignore=~/.agignore'


### ~~~ VIM TOOLS ~~~ ###
alias vi='vim'
alias vim='mvim -v'

### ~~~ CONFIG FILES ~~~ ###
alias szsh='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias vzsh='vim ~/.zshrc'
alias vinstall="vim +PluginInstall +qall"


# Git Commands
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
# alias gpof="git push origin -f"
alias gpull='git pull; git remote prune origin; migr;'
alias gr="git rebase"
alias grl="git reflog"
alias grc="git rebase --continue"
alias grh="git reset HEAD~"
alias grom="git rebase origin/master"
alias grs="git rebase --skip"
alias gs="git status"
alias gdeleteall="git branch | grep -v 'master' | xargs git branch -D"
alias gremoveuntracked="git clean -fd"
alias wip="gaa; git commit -m 'work in progress (not ready for review)'"
alias gdeleteall="git branch | grep -v 'master' | xargs git branch -D"



### ~~~ ARCANIST ~~~ ###
alias ad="arc diff"
alias adnu="arc diff --nounit"
alias al="git fetch; git rebase origin/master; arc land"
alias adu="arc diff --update"
alias adm="arc diff --base git:origin/master"
alias adpc="arc diff --plan-changes"



### ~~~ GOLANG ~~~ ###
alias gog="go get"
alias gor="go run"
alias gota="go test"
alias got="go test -run"
alias gotv="go test -v -run"
alias gotjm="go test jello/models -v"
alias gotr="go test -run -v"



### ~~~ DIRECTORIES ~~~ ###
alias code="cd ~/code"
alias desktop='cd ~/Desktop'
alias j="cd ~/code/julie"
alias i="cd ~/code/julie/go/src/github.com/julieqiu/inspiration"
alias jgo="i"
### ~~~ SPRING DIRECTORIES ~~~ ###
alias ca="cd ~/code/branded/exp/calypso"
alias caa="cd ~/code/branded/exp/calypso/app"
alias car="ca; RAILS_ENV=local rails s -p 5500"
alias b="cd ~/code/branded/"
alias bgo="jello"
alias bgom="jello; cd ./models;"
alias bgomp="cd ~/code/branded/go/src/jello/models/product_merge"
alias bgosu="cd ~/code/branded/go/src/jello/integrations/osu"
alias bgosuj="cd ~/code/branded/go/src/jello/integrations/osu/jobs"
alias bios="cd ~/code/branded/ios"
alias bjs="cd ~/code/branded/js"
alias bops="cd ~/code/branded/ops"
alias bpy="cd ~/code/branded/python"
alias btools="cd ~/code/branded/tools"
alias jello="cd ~/code/branded/go/src/jello"
alias jl="cd ~/code/branded/go/src/jello"
alias jlm="cd ~/code/branded/go/src/jello/models"



### ~~~ SPRING DATABASES & SERVERS ~~~ ###
### ~~~ SPRING MIGRATE ~~~ ###
function migr {
    ~/code/branded/tools/migrate_dev.sh
}
### ~~~ SPRING REGOLD ~~~ ###
function regold {
    ~/code/branded/tools/regold.sh $1
}
### ~~~ SPRING COPY 4REAL THINGS ~~~ ###
function copy_vendor {
    ~/code/branded/tools/sql/copiers/copy_vendor.py \
        ${2:-4real} \
        --dest_env=${3:-local} \
        ${4:---write} \
        $1
}
function copy_product {
    ~/code/branded/tools/sql/copiers/copy_product.py \
        ${3:-4real} \
        --dest_vendor_id=$2 \
        --dest_env=${4:-local} \
        ${5:---write} \
        $1
}
function in4r {
    if [[ $(git tag --contains $1 | grep "^4real") ]]; then
        echo "yeppers"
    else
        echo "nope"
    fi
}
### ~~ SPRING LOCAL DATABASES ~~~ ###
alias psqlbd="psql branded_dev"
alias psqlbt="psql branded_test"
alias psqled="psql echub_dev"
alias psqlet="psql echub_test"
### ~~~ SPRING REMOTE DATABASES ~~~ ###
alias 4rbr="fab env:4real psql:branded"
alias 4rec="fab env:4real psql:echub"
alias 4rec_write="fab env:4real psql_write:branded"
alias 4rbr_write="fab env:4real psql_write:echub"
alias demb="fab env:demo psql:branded"
alias deme="fab env:demo psql:echub"
alias devb="fab env:dev psql:branded"
alias deve="fab env:dev psql:echub"

alias redshift='PGPASSWORD=$DB_REDSHIFT_PASSWORD psql -h spring.cminumodijif.us-east-1.redshift.amazonaws.com -U $DB_REDSHIFT_USER -p5439 for_real'
### ~~~ SPRING SERVERS ~~~ ###
alias sfe="$HOME/code/branded/tools/run_sfe.sh"
alias vfe="$HOME/code/branded/tools/run_vfe.sh"
alias xfe="$HOME/code/branded/tools/run_xfe.sh"
alias echub="$HOME/code/branded/tools/run_echub.sh"
alias osu="./tools/run_osu.sh -runOnly=order_status"

alias brwork="go run go/src/jello/branded_worker/branded_worker.go"
alias echwork="go run go/src/jello/integrations/echub_worker/echub_worker.go"



### ~~~ FIXES ~~~ ###
alias omgwtf="killall {vfe,sfe,echub,fswatch,xfe}{,_test}"
# Fix psql
alias fixpsql="/usr/local/opt/postgresql93/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log"
alias fixpsql2="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log restart"
# Fix elastic search
alias elasticsearch="b; ~/code/branded/tools/start_elasticsearch.sh --recreate"



### ~~~ RANDOM ~~~ ###
alias movefile="for filename in *.jpg; do mv "$filename" "prefix_$filename"; done;"
# search for processes by name
alias procs="ps -ef | ag"
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



### ~~~ FUNCTIONS ~~~ ###
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


# Elastic Search
function elasticsearch2 {
    eval "$(${HOME}/code/branded/tools/run_docker_machine.sh)"
    curl -XPUT "${DOCKER_HOST_IP}:9200/products_*/_alias/products"
}


# Getting products from Shopify
function shopify_api {
    curl --header "X-Shopify-Access-Token:$JELLO_SHOPIFY" "https://jello-test.myshopify.com/admin/products/$1.json" | jq "."
}

## curl "http://localhost:3003/api/1/vendors/1/product_info?product_ids=262001613" | jq "."
