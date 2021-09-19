# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/bin/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/bin/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/bin/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/bin/homebrew/opt/fzf/shell/key-bindings.bash"
