#!/usr/bin/env bash
set -euo pipefail

#!usr/bin/env bash
set -euo pipefail

# Ensure Homebrew binaries (fzf, fd, rg...) are found
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Log everything for debugging
exec > >(tee -a /tmp/tmux-new-pane.log) 2>&1

# If you need the pane's cwd:
dir="$(tmux display -p "#{pane_current_path}")"
cd "$dir" || exit 1

if [[ $# -eq 1 ]]; then
  selected=$1
else
selected=$(find ~/dotfiles ~/Desktop/projects ~/Desktop/projects/nvim-plugins \
  -mindepth 1 -maxdepth 1 -type d 2>/dev/null |
  sed "s|^$HOME|~|" |
  fzf --no-height --border --reverse
) || exit 0
fi

[[ -z $selected ]] && exit 0
name=$(basename "$selected" | tr . _)

# Jump if window name exists; else create it in current session
tmux list-windows -F '#W' | grep -Fxq "$name" \
  && tmux select-window -t "$name" \
  || tmux new-window -c "$selected" -n "$name"
