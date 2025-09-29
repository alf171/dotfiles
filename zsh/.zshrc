# c++ alias
alias g++='g++ -std=c++17'

autoload -U colors && colors

# zsh functions
source ~/.zsh_functions

# enable vi mode
setopt promptpercent
setopt prompt_subst
bindkey -v
typeset -g MODE_PROMPT="%F{blue}[I]%f "
zle -N zle-line-init _zle_update_mode
zle -N zle-keymap-select _zle_update_mode
PROMPT='${MODE_PROMPT}%F{red}%n%f@%F{blue}%m%f %F{yellow}%~%f %# '
unset RPS1 RPS2

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

# below should be replaced by above
eval "$(/opt/homebrew/bin/brew shellenv)"
# setup java paths
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"

# zoxide
eval "$(zoxide init zsh)"
bindkey '^G' zoxide_fzf
alias zf='zoxide query -l | fzf --height=40% --reverse --prompt="zoxide > " | xargs -r cd'

#zig
export ZIG_LOCAL_CACHE_DIR="$HOME/.zig-local-cache"
export ZIG_GLOBAL_CACHE_DIR="$HOME/.zig-global-cache"
