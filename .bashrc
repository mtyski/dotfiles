#
# ~/.bashrc
# EndeavourOS-based; Ubuntu might complain about it :D

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# history
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# git
export GPG_TTY=$(tty)
alias dotfiles="$(which git) --git-dir=/home/$USER/.dotfiles/ --work-tree=/home/$USER"

# PATH
export PATH="$PATH:$HOME/.local/bin"

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# starship
eval "$(starship init bash)"

# autojump
[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh

# fnm
eval "$(fnm env --use-on-cd --corepack-enabled --shell bash)"

# fzf
eval "$(fzf --bash)"
[ -f "$HOME/.config/fzf/themes/noctalia.sh" ] && . "$HOME/.config/fzf/themes/noctalia.sh"

# distrobox
if [[ -n "$CONTAINER_ID" ]]; then
  PATH="$PATH:$HOME/.dotnet/tools:$HOME/.rider/bin"
  alias silent-rider='rider . > /dev/null 2>&1 &'
fi

if [[ -z "$CONTAINER_ID" ]]; then
  source <(noctalia completions bash)
fi
