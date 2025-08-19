# c++ alias
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
alias vim="nvim"

# tmux
alias t="tmux -f ~/.tmux.conf new-session"
alias tl="tmux list-sessions"
alias ta="tmux attach-session"

# git shortcuts
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
# no git push command since it conflicts with git pull && isn't used that often in prod code
alias gp="git pull"
alias gpu="git push"
alias gpr="git pull --rebase"
alias gl="git log"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"
alias gr="git restore"
alias grs="git restore --staged"
alias gst="git stash"
alias gstp="git stash pop"

# ignore <C-d>
setopt IGNORE_EOF
alias reload="source ~/.zshrc && echo '.zshrc reloaded ✅'"

# setup java paths
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"

# zoxide
eval "$(zoxide init zsh)"
bindkey '^G' zoxide_fzf
alias zf='zoxide query -l | fzf --height=40% --reverse --prompt="zoxide > " | xargs -r cd'

