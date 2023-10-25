local M = {
  "VonHeikemen/lsp-zero.nvim"
}

M.branch = "v3.x"
M.dependencies = {
  -- LSP support
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  -- Snippets
  "L3MON4D3/LuaSnip"
  }

return M
