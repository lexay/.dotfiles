# System
export EDITOR='nvim --clean'
export TERMINAL='alacritty'
export BROWSER='brave'
export READER='zathura'

# Local config, share, cache
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# PATH extension
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/cargo/bin:$PATH"
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/rbenv/bin:$PATH"
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/my_scripts/uav:$PATH"
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/my_scripts/yls:$PATH"

# LESS
export LESSHISTFILE="-"
export LESSSECURE=1

# ZSH
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.histfile"

# Rust
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# Passwordstore
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# RBENV
export RBENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/rbenv"

# FZF
export FZF_DEFAULT_OPTS="--height=50% --layout=reverse"

# QT
export QT_QPA_PLATFORMTHEME="qt5ct"

# GTK
export GTK2_RC_FILES="$HOME/.config/gtk-2.0"
export GTK_THEME="Mint-Y-Dark-Teal"

# Zoxide
export _ZO_FZF_OPTS="--height=100 --layout=reverse"
