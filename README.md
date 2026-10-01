# Dotfiles

Personal dotfiles for Niri, Noctalia shell and other tooling.

## Requirements

- [Niri](https://github.com/niri-wm/niri)
- [Noctalia shell](https://github.com/noctalia-dev/noctalia)
- [Git](https://git-scm.com/)

## Optional packages

- [Distrobox](https://distrobox.it/)

## Cloning

1. Backup any of the configs that you care about (`.bashrc` and `~/.config/git/config` come to mind).
1. Run the following script.

```bash
git clone --bare https://github.com/mtyski/dotfiles.git $HOME/.dotfiles
alias dotfiles="$(which git) --git-dir=$HOME/.dotfiles --work-tree=$HOME"
touch ~/.config/niri/noctalia/{displays,binds}-specific.kdl
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

## Adjusting config

Use `dotfiles` alias for all operations. Git should track the edited files.
