# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/julie/bin/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/bin/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/bin/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/bin/homebrew/opt/fzf/shell/key-bindings.zsh"