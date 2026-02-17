#!/usr/bin/env bash

dir=$(tmux display -p "#{pane_current_path}")
cd "$dir" || exit 1

url=$(git remote get-url origin 2>/dev/null || echo "")

# open on github
if [[ $url == *"github.com"* ]]; then
  clean_url=${url%.git}
  clean_url=${clean_url/git@github.com:/https://github.com/}
  target_url="$clean_url"
# open on c.a
else
  repo=$(basename -s .git "$url")
  repo=${repo:-$(basename "$PWD")}
  target_url="https://code.amazon.com/packages/${repo}/trees/mainline"
fi

# over ssh, print the target since open won't work
if [[ -n "$SSH_CONNECTION" ]]; then
    echo "$target_url"
else
    open "$target_url"
fi
