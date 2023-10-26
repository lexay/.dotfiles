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
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  -- Snippets
  "L3MON4D3/LuaSnip"
  }

M.config = function()
  local lsp_zero = require("lsp-zero")
  local lsp_config = require("lspconfig")

  lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
  end)
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {"solargraph"},
    handlers = {
      lsp_zero.default_setup,
      solargraph = function()
        lsp_config.solargraph.setup({})
      end
    }
  })
end

return M
