local fn = vim.fn
--Autoinstall Packer
local install_path = '/home/alex/.local/share/nvim-nightly/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer... Restart Neovim!'
  vim.cmd([[packadd packer.nvim]])
-- Reload Neovim whenever you save your packer file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_config.lua source <afile> | PackerCompile
  augroup end
  ]]
end
--
local packer = require('packer')
local use = packer.use

packer.init {
  package_root = os.getenv('HOME') .. '/.local/share/nvim-nightly/site/pack',
  compile_path = os.getenv('HOME') .. '/.config/nvim-nightly/plugin/packer_compiled.vim'
}

packer.startup(function()
  use 'wbthomason/packer.nvim'
  -- Other plugins
  use {
    'benmills/vimux',
    config = function() require('plugins.vimux').config() end
  } 
  use 'christoomey/vim-tmux-navigator'
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp').config() end,
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  use { 'L3MON4D3/LuaSnip',
    config = function() require('luasnip/loaders/from_vscode').lazy_load() end,
  }
  use 'rafamadriz/friendly-snippets'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('plugins.lualine').config() end,
  }
  use 'morhetz/gruvbox'
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig').config() end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }
  use {
    'tpope/vim-commentary',
    'tpope/vim-dispatch',
    'tpope/vim-endwise',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-rails',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
  }
  use { 'williamboman/nvim-lsp-installer',
    requires = {'neovim/nvim-lspconfig'},
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the bottom after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
