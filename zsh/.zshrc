
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alaffont/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alaffont/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alaffont/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alaffont/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias g++='g++ -std=c++17'

autoload -U colors && colors
# add alias color
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# enable vi mode
bindkey -v

# zsh functions
source ~/.zsh_functions

# Created by `pipx` on 2025-03-01 19:07:01
export PATH="$PATH:/Users/alaffont/.local/bin"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="
  --bind=ctrl-j:down
  --bind=ctrl-k:up
"

# nvim
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias n="nvim"

# tmux
alias t="tmux -f /dev/null new-session \; source-file ~/.tmux.conf"
alias tl="tmux list-sessions"
alias ta="tmux attach-session"

# git shortcuts
alias gs="git status --short"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gu="git pull"
alias gl="git log"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"

# ignore <C-d>
setopt IGNORE_EOF
alias reload="source ~/.zshrc && echo '.zshrc reloaded ✅'"

