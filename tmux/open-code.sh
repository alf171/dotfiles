#!/usr/bin/env bash

dir=$(tmux display -p "#{pane_current_path}")
cd "$dir" || exit 1

url=$(git remote get-url origin 2>/dev/null || echo "")

# open on github
if [[ $url == *"github.com"* ]]; then
  clean_url=${url%.git}
  clean_url=${clean_url/git@github.com:/https://github.com/}
  open "$clean_url"
# open on c.a
else
  repo=$(basename -s .git "$url")
  repo=${repo:-$(basename "$PWD")}
  custom_url="https://code.amazon.com/packages/${repo}/trees/mainline"
  open "$custom_url"
fi

