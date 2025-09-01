# ~/.config/fish/config.fish

### --- Aliases / Functions ---

# C++ alias
alias g++="g++ -std=c++17"

# Git aliases
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
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

# Neovim aliases
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias n='nvim'
alias vim='nvim'

# Tmux aliases
alias t="tmux -f ~/.tmux.conf new-session"
alias tl="tmux list-sessions"
alias ta="tmux attach-session"

# Reload config
alias reload="source ~/.config/fish/config.fish; echo 'config.fish reloaded ✅'"


### --- PATH setup ---

# pipx bin dir
set -gx PATH $PATH /Users/alaffont/.local/bin

# Java
set -gx PATH /opt/homebrew/opt/openjdk@21/bin $PATH
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@21/include"


### --- Prompt / Colors ---

# Fish uses functions for prompt
function fish_prompt
    set_color red
    echo -n (whoami)
    set_color normal
    echo -n "@"
    set_color blue
    echo -n (hostname -s)
    set_color normal
    echo -n " "
    set_color yellow
    echo -n (prompt_pwd)
    set_color normal
    echo -n " > "
end


### --- Keybindings / Input Mode ---

# Enable vi mode
fish_vi_key_bindings

# Example of custom binding (similar to bindkey '^G' zoxide_fzf in zsh)
# We'll define it later after zoxide init.


### --- FZF Integration ---

# Set default fzf options
set -gx FZF_DEFAULT_OPTS "--bind=ctrl-j:down --bind=ctrl-k:up"

# Source fzf keybindings if available
if test -f ~/.fzf.fish
    source ~/.fzf.fish
end


### --- Zoxide Integration ---

# Init zoxide for fish
zoxide init fish | source

# Ctrl-G to open zoxide fzf picker
bind \cg 'zoxide query -l | fzf --height=40% --reverse --prompt="zoxide > " | read -l result; and cd "$result"'

alias zf='zoxide query -l | fzf --height=40% --reverse --prompt="zoxide > " | read -l result; and cd "$result"'

# Ctrl-j/k → next/prev suggestion
bind \cj down-or-search
bind \ck up-or-search
