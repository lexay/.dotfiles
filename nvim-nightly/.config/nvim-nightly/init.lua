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
require('options')
require('utils')
require('plugins')
require('keymaps')

-- Lazy, Package Manager
local lazypath = os.getenv('HOME') .. "/.local/share/nvim-nightly/data/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins',
  { root = os.getenv('HOME') .. "/.local/share/nvim-nightly/data/lazy" })
