# RUBY
export RBENV_ROOT=~/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"

# GOPATHs
export GOPATH=$HOME/code/jellolabs/branded/go
export GOPATH=$GOPATH:$HOME/code/jellolabs/go
export GOPATH=$GOPATH:/usr/local/Cellar/go/1.6.2/libexec

export PYTHONPATH=$HOME/code/jellolabs/branded/python

# SPRING PATHs
export PATH=$PATH:$HOME/code/jellolabs/branded/go/bin
export PATH=$PATH:$HOME/code/jellolabs/arcanist/bin
export PATH=$PATH:$HOME/code/jellolabs/go/bin

# MY PATHs
export PATH=$PATH:$HOME/code/julie/go/bin

# GENERAL PATHs
export PATH=$PATH:/Library/PostgreSQL/9.3/bin
export PATH=$PATH:/usr/local/Cellar/go/1.6.2/libexec/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/bin/git
export PATH=$PATH:/usr/local/bin/gofmt
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/bin

# NODE
export NVM_DIR=$HOME/.nvm
. "$(brew --prefix nvm)/nvm.sh"

# GENERAL EXPORTs
export DOCKER_API_VERSION=1.23
export KETTIMEOUT=1
export EDITOR="vim"
export GIT_EDITOR='vim'
export VISUAL="vim"
export LSCOLORS="exfxcxdxbxegedabagacad"
export PGHOST=localhost
export ENVIRONMENT="dev"
export POSTGRES_PASSWORD="12341234"
