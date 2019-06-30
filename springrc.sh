# EXPORTs
#
export CODE=$HOME/Code
export BRANDED=$CODE/branded
export PY3VENV=$CODE/venv3/shopspring/bin/activate
export SPRINGVENV=$CODE/spring-python2/bin/activate

### ~~~ Go  ~~~ ###
export GOPATH=$HOME/go:/usr/local/opt/go/libexec

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
alias bpy2='source $SPRINGVENV'
alias spw='cd $BRANDED/py3/shopspring/personalization/workers'
alias bpy3spw="bpy3; spw"
alias bpyq3='bpy3; $BRANDED/py3/shopspring/pietl/qiu'
alias bpy3ts='cd $BRANDED/py3/shopspring/test/components/'
alias twigg='cd $BRANDED/py3/shopspring/search/twiggle/'

### ~~~ SPRING VM ~~~ ###
alias vup='cd $HOME/springdev; vagrant up'
alias vssh='cd $HOME/springdev; vagrant ssh -- -l springdev'


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
alias invprice='PGPASSWORD=Branded13 psql -w -U spring -h inventory-and-price-dev.c5p1bl9rzd6g.us-east-1.rds.amazonaws.com inventory_and_price_dev'

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
alias vm='cd $HOME/springdev; vagrant ssh'

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

# added by travis gem
[ -f /Users/julie/.travis/travis.sh ] && source /Users/julie/.travis/travis.sh

function engmrp {
    if [ "$1" == "-m" ]; then
      RUNMODE=$2
      shift
      shift
    else
      RUNMODE="local"
    fi
    go run go/src/jello/exp/queuer_inject/queuer_inject.go --runMode $RUNMODE eng-merge-remote-product "{\"vendor_id\":$1,\"integration_id\":\"$2\"}"
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
