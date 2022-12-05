HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000


setopt appendhistory
setopt autocd
setopt nobeep
setopt correct
setopt extendedglob
setopt histignorealldups
setopt nocheckjobs
setopt nomatch
setopt nocaseglob
setopt notify
setopt numericglobsort

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/.zcompcache

WORDCHARS=${WORDCHARS//\/[&.;]}

bindkey -v
export KEYTIMEOUT=1

autoload -U compinit colors
compinit -d
colors

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt prompt_subst

# PS1="%B%{$fg[green]%}%n@%M:%{$fg[blue]%}%~%{$reset_color%}%b$ "
PROMPT="%(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> )"
PROMPT+=" %{$fg[cyan]%}%~%{$reset_color%} "

if [ -f ~/.config/aliasrc ]; then
    . ~/.config/aliasrc
fi

# Change cursor shape based on current keymap: vi insert or command
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  else
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

# Make vi insert default keymap.
zle-line-init() {
  zle -K viins
  echo -ne '\e[6 q'
}
zle -N zle-line-init



# GPG for SSH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# RBENV initialization
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# eval "$(starship init zsh)"
#
bindkey -s "^n" "tmux_sessionizer\n"
openclose() {
  "$@" &
  disown
  exit
}
