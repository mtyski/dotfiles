#!/usr/bin/env bash

chosenBranch="$(git branch -a | grep -v '/HEAD\s' | fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' | sed 's#^remotes/[^/]*/##')"

if [[ -n "$chosenBranch" ]]; then
  git switch "$chosenBranch"
else
  echo "No branch was chosen; exiting…"
fi
