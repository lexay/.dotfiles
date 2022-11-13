export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export READER='zathura'

export LESSHISTFILE="-"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.histfile"

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export RBENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/rbenv"

export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/cargo/bin:$PATH"
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/my_scripts/uav:$PATH"
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/my_scripts/yls:$PATH"
# export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/my_scripts/selenium:$PATH"
# export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/rbenv/bin:$PATH"

export FZF_DEFAULT_OPTS="--height=50% --layout=reverse"


export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
