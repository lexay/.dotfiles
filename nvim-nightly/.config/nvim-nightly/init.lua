local o = vim.opt

-- Configure paths for separate nightly build
o.runtimepath:remove("~/.config/nvim")
o.runtimepath:remove("~/.config/nvim/after")
o.runtimepath:remove("~/.local/share/nvim/site")
o.runtimepath:remove("~/.local/share/nvim/site/after")

o.runtimepath:prepend("~/.config/nvim-nightly")
o.runtimepath:append("~/.config/nvim-nightly/after")
o.runtimepath:prepend("~/.local/share/nvim-nightly/site")
o.runtimepath:append("~/.local/share/nvim-nightly/site/after")

o.packpath:remove("~/.config/nvim")
o.packpath:remove("~/.config/nvim/after")
o.packpath:remove("~/.local/share/nvim/site")
o.packpath:remove("~/.local/share/nvim/site/after")

o.packpath:prepend("~/.config/nvim-nightly")
o.packpath:append("~/.config/nvim-nightly/after")
o.packpath:prepend("~/.local/share/nvim-nightly/site")
o.packpath:append("~/.local/share/nvim-nightly/site/after")

-- Require utils first to be able to load correctly other settings that depend on it
require('utils')
require('plugins')
require('keymaps')
require('options')


declare_filetype('.cr', 'crystal')
