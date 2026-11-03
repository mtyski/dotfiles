#!/usr/bin/env bash

chosenWorktree="$(git worktree list --porcelain | grep 'worktree' | fzf --ansi --height '40%' --tac | awk '{print $2}')"
[ -n "$chosenWorktree" ] && cd "$chosenWorktree" || echo "No worktree chosen, staying in current directory…"
unset chosenWorktree
