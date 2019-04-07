# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rfacundes/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/rfacundes/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rfacundes/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/rfacundes/.fzf/shell/key-bindings.zsh"
