#!/usr/bin/env bash
set -euo pipefail

dir=$(tmux display -p '#{pane_current_path}')
cd "$dir" || exit 1

url=$(git remote get-url origin 2>/dev/null || echo "")

to_https_github() {
  local remote="$1" host path
  case "$remote" in
    git@github.com:*)
      path="${remote#git@github.com:}"
      printf 'https://github.com/%s\n' "${path%.git}"
      ;;
    https://github.com/*)
      printf '%s\n' "${remote%.git}"
      ;;
    http://github.com/*)
      printf '%s\n' "${remote%.git}"
      ;;
    *)
      return 1
      ;;
  esac
}

# open github
if [[ -n "$url" ]] && gh_url=$(to_https_github "$url"); then
  open "$gh_url"
# open custom link
else
  repo=$(basename -s .git "$url")
  repo=${repo:-"unknown"}
  custom_url="https://code.amazon.com/packages/${repo}/trees/mainline"
  open "$custom_url"
fi

