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

  lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  end)
end

return M
