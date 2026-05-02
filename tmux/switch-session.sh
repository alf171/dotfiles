#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

selected=$(
  tmux list-sessions -F '#{session_name}' |
    fzf --no-height --border --reverse \
      --prompt='session> '
) || exit 0

[[ -z $selected ]] && exit 0

tmux switch-client -t "$selected"
