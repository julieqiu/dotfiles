alias python=python3
alias pip=pip3

#
# ALIASes
#

### ~~~ SHORTCUTS TO DIRECTORIES ~~~ ###
alias tv='cd $CODE/theviewfromjq'


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


### ~~~ RANDOM ~~~ ###
alias movefile='for filename in *.jpg; do mv "$filename" "prefix_$filename"; done;'
# search for processes by name
alias procs="ps -ef | rg"
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


# My function to take quick notes on useful commands
notes() {
  if [ ! -z "$1" ]; then
    # Using the "$@" here will take all parameters passed into
    # this function so we can place everything into our file.
    echo $(date +"%Y-%m-%d %H:%M:%S") $@  >> $HOME/Dropbox/Spring/notes.md
  else
    # If no arguments were passed we will take stdout and place
    # it into our notes instead.
    echo $(date +"%Y-%m-%d %H:%M:%S") "$(cat)"  >> $HOME/Dropbox/Spring/notes.md
  fi
}
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
