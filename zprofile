#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR="vim"
export VISUAL='vim'
export GIT_EDITOR='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

#
# My Settings
#
export ENVIRONMENT="dev"


#
# GOPATHs
#
export GOPATH=$HOME/code/jellolabs/branded/go
export GOPATH=$GOPATH:$HOME/code/jellolabs/go
export GOPATH=$GOPATH:/usr/local/Cellar/go/1.6.2/libexec

#
# SPRING PATHs
#
export PATH=$PATH:$HOME/code/jellolabs/branded/go/bin
export PATH=$PATH:$HOME/code/jellolabs/arcanist/bin
export PATH=$PATH:$HOME/code/jellolabs/go/bin

#
# MY PATHs
#
export PATH=$PATH:$HOME/code/julie/go/bin

#
# GENERAL PATHs
#
export PATH=$PATH:/Library/PostgreSQL/9.3/bin
export PATH=$PATH:/usr/local/Cellar/go/1.6.2/libexec/bin


### Python 3 environment initialization
eval "$(pyenv init -)"
export WORKON_HOME="/Users/Julie/Code/venv3"
export PROJECT_HOME="/Users/Julie/Code/jellolabs/branded/py3"
pyenv virtualenvwrapper
export FLASK_DEBUG=1
### End Python 3 environment initialization
