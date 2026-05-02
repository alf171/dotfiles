#!/usr/bin/env bash
set -euo pipefail

# set path for tools like (fzf, fd, rg...)
# will only work on mac
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Log everything for debugging
# exec > >(tee -a /tmp/tmux-new-pane.log) 2>&1

# If you need the pane's cwd:
dir="$(tmux display -p "#{pane_current_path}")"
cd "$dir" || exit 1

if [[ $# -eq 1 ]]; then
  selected=$1
else
selected=$(find ~/dotfiles ~/projects ~/projects/nvim-plugins \
  -mindepth 1 -maxdepth 1 -type d 2>/dev/null |
  fzf --no-height --border --reverse \
    --prompt='session> '
) || exit 0
fi

[[ -z $selected ]] && exit 0
name=$(basename "$selected" | tr . _)

if tmux has-session -t "=$name" 2>/dev/null; then
  tmux switch-client -t "=$name"
else
  tmux new-session -d -s "$name" -c "$selected"
  tmux switch-client -t "=$name"
fi
