### Python 3 environment initialization
# eval "$(pyenv init -)"
pyenv() {
    eval "$( command pyenv init - )"
    pyenv "$@"
}
export WORKON_HOME="/Users/julie/Code/venv3"
export PROJECT_HOME="/Users/julie/Code/branded/py3"
export FLASK_DEBUG=1
### End Python 3 environment initialization
