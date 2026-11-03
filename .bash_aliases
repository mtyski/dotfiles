# worktree picking
alias pick-a-fucking-tree='. $HOME/.local/bin/pick-a-worktree.sh'
# dorfiles
alias dotfiles="$(which git) --git-dir=/home/$USER/.dotfiles/ --work-tree=/home/$USER"
# completions for dotfiles alias
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles
# load completions for git
_completion_loader git

