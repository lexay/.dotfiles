# History:
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Options
setopt GLOB_DOTS
setopt APPEND_HISTORY
setopt NO_BEEP
setopt CORRECT
setopt EXTENDED_GLOB
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt NO_CHECK_JOBS
setopt NOMATCH
setopt NO_CASE_GLOB
setopt NOTIFY
setopt NUMERIC_GLOB_SORT
setopt PROMPT_SUBST

# Plugins
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
autoload -U compinit && compinit -d

# Colors
# Highlighters
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]="fg=#af87af,bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=#af87af,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#af87af,bold"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=#5faf5f"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=#5faf5f"
# ZSH_HIGHLIGHT_STYLES[path]="none"
# User prompt
# Light %? and dark green %~
PROMPT="%(?.%B%F{#87af87}>.%B%F{#d7875f}>)%f%b"
PROMPT+=" %B%F{#5f875f}%~%f%b "
autoload -U colors && colors


# Load aliases
if [ -f ~/.config/aliasrc ]; then
    . ~/.config/aliasrc
fi

# Use VIM keys
bindkey -v
export KEYTIMEOUT=1
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
# Navigate smart with zoxide
bindkey -s "^f" "zi\n"
# + create a named tmux session in CWD
bindkey -s "^o" "zimux\n"
# Edit zoxide list
bindkey -s "^e" "zoxide edit\n"
# Attach to existing tmux session
bindkey -s "^a" "tmux attach\n"
# Create new tmux session
bindkey -s "^n" "tmux\n"
