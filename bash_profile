export GOPATH=$HOME/code/go:"/usr/local/opt/go16/libexec"
export PATH=${GOPATH[@]//:/\/bin:}/bin:$PATH
export RBENV_ROOT=~/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"
export NVM_DIR=/Users/Julie/.nvm
source /usr/local/opt/nvm/nvm.sh
export GOPATH=$GOPATH:$HOME/code/branded/go
export PATH=$HOME/code/branded/go/bin:$PATH
export PATH=$HOME/code/arcanist/bin:$PATH
