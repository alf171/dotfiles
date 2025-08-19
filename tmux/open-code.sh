#!/usr/bin/env bash

# Open the current repository in the browser
dir=$(tmux display -p "#{pane_current_path}")
cd "$dir" || exit 1

url=$(git remote get-url origin 2>/dev/null || echo "")

if [[ $url == *"github.com"* ]]; then
  # Strip .git if present and normalize to https://
  clean_url=${url%.git}
  clean_url=${clean_url/git@github.com:/https://github.com/}
  open "$clean_url"
else
  repo=$(basename -s .git "$url")
  # fallback if url was empty (not a repo at all)
  repo=${repo:-$(basename "$PWD")}
  custom_url="https://c.a.com/packages/${repo}/trees/mainline"
  open "$custom_url"
fi

