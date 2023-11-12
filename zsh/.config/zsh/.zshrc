# History:
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Options
setopt globdots
setopt appendhistory
setopt nobeep
setopt correct
setopt extendedglob
setopt histignorealldups
setopt histignorespace
setopt histfindnodups
setopt histsavenodups
setopt nocheckjobs
setopt nomatch
setopt nocaseglob
setopt notify
setopt numericglobsort
setopt prompt_subst

# Completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/.zcompcache

WORDCHARS=${WORDCHARS//\/[&.;]}

# Use VIM keys
bindkey -v
export KEYTIMEOUT=1

# Colors
autoload -U compinit colors
compinit -d
colors

# ZSH plugins
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User prompt
# PS1="%B%{$fg[green]%}%n@%M:%{$fg[blue]%}%~%{$reset_color%}%b$ "
PROMPT="%(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> )"
PROMPT+=" %{$fg[cyan]%}%~%{$reset_color%} "

# Load aliases
if [ -f ~/.config/aliasrc ]; then
    . ~/.config/aliasrc
fi

# Change cursor based on current vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  else
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

# Make vi insert mode default
zle-line-init() {
  zle -K viins
  echo -ne '\e[6 q'
}
zle -N zle-line-init

# GPG for SSH
export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Initialization
# RBENV
eval "$(rbenv init - zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Starship
# eval "$(starship init zsh)"

# Custom functions
# Start GUI apps within TERMINAL:
openclose() {
  "$@" &
  disown
  exit
}

# Keybindings
# Start predefined session in tmux:
bindkey -s "^n" "fzf_tmux_sessions\n"
# Navigate smart with zoxide
bindkey -s "^f" "zi\n"
