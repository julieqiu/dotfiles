#
# EXPORTs
#
export CODE=$HOME/Code
export BRANDED=$CODE/branded
export PY3VENV=$CODE/venv3/shopspring/bin/activate

### ~~~ Go  ~~~ ###
export GOPATH=$BRANDED/go:$HOME/go:/usr/local/opt/go/libexec

### ~~~ Python 3 ~~~ ###
export WORKON_HOME=$CODE/venv3
export PROJECT_HOME=$BRANDED/py3

### ~~~ PATH  ~~~ ###
# Spring
export PATH=$PATH:$BRANDED/go/bin
export PATH=$PATH:$CODE/arcanist/bin
export PATH=$PATH:$CODE/go/bin
# General
export PATH=$PATH:/Library/PostgreSQL/9.3/bin
export PATH=$PATH:/usr/local/Cellar/go/1.6.2/libexec/bin

#
# ALIASes
#

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
alias findspace="du -shc .??* *"


### ~~~ VIM TOOLS ~~~ ###
alias vi='vim'
alias vim='mvim -v'


### ~~~ CONFIG FILES ~~~ ###
alias szsh='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias vzsh='vim ~/.zshrc'
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
# alias gpof="git push origin -f"
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


### ~~~ SPRING DIRECTORIES ~~~ ###
alias b='cd $BRANDED'

alias ca="b; cd exp/calypso"
alias cal="ca; cd lib"
alias caa="ca; cd app"
alias cas="ca; cd app/assets/stylesheets/carts"
alias cav="ca; cd app/views/carts"
alias cac="ca; cd app/controllers"
alias calocal="ca; RAILS_ENV=local rails s -p 5600"
alias cadev="ca; RAILS_ENV=development rails s -p 5600"
alias camigr="bundle exec rake db:migrate RAILS_ENV=development"

alias jello="b; cd go/src/jello"

alias bgo="jello"
alias bgom="jello; cd models"
alias bgomp="jello; cd models/product_merge"
alias bgosu="jello; cd integrations/osu"
alias bgosuj="bgosu; cd jobs"
alias bios="b; cd ios"
alias bjs="b; cd js"
alias bops="b; cd ops"
alias btools="b; cd tools"
alias tss="b; cd tools/sql/suppliers"

alias startcelery="celery -A celery_proj worker --loglevel=info"
alias bpy3='source $PY3VENV'
alias spw='cd $BRANDED/py3/shopspring/personalization/workers'
alias bpy3spw="bpy3; spw"
alias bpyq3='bpy3; $BRANDED/py3/shopspring/pietl/qiu'

### ~~~ SPRING DATABASES & SERVERS ~~~ ###
### ~~~ SPRING MIGRATE ~~~ ###
function migr {
    "$BRANDED"/tools/migrate_dev.sh
}
### ~~~ SPRING REGOLD ~~~ ###
function regold {
    "$BRANDED"/tools/regold.sh "$1"
}

function in4r {
    if [[ $(git tag --contains $1 | grep "^jenkins2-4real") ]]; then
        echo "yeppers"
    else
        echo "nope"
    fi
}

function indemo {
    if [[ $(git tag --contains $1 | grep "^demo") ]]; then
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
alias 4rec_write="fab env:4real psql_write:branded"
alias demb_write="fab env:demo psql_write:branded"
alias demb="fab env:demo psql:branded"
alias devb="fab env:dev psql:branded psql_write:branded"

alias redshift='PGPASSWORD=$DB_REDSHIFT_PASSWORD psql -h spring.cminumodijif.us-east-1.redshift.amazonaws.com -U $DB_REDSHIFT_USER -p5439 for_real'
### ~~~ SPRING SERVERS ~~~ ###
alias sfe='$BRANDED/tools/run_sfe.sh'
alias vfe='$BRANDED/tools/run_vfe.sh'
alias xfe='$BRANDED/tools/run_xfe.sh'
alias echub='$BRANDED/tools/run_echub.sh'
alias osu='$BRANDED/tools/run_osu.sh -runOnly=order_status'

alias brwork="go run go/src/jello/branded_worker/branded_worker.go"
alias echwork="go run go/src/jello/integrations/echub_worker/echub_worker.go"


### ~~~ FIXES ~~~ ###
alias omgwtf="killall {vfe,sfe,echub,fswatch,xfe}{,_test}"
# Fix psql
alias fixpsql="/usr/local/opt/postgresql93/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log"
alias fixpsql2="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log restart"
# Fix elastic search
alias elasticsearch='b; $BRANDED/tools/start_elasticsearch.sh --recreate'
alias fixdocker="docker-machine rm local; docker-machine create -d virtualbox local;"

### ~~~ RANDOM ~~~ ###
alias movefile='for filename in *.jpg; do mv "$filename" "prefix_$filename"; done;'
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
    gotv "$1" > "$name".txt
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
