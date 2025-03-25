local M = {
  "VonHeikemen/lsp-zero.nvim",
}

M.branch = "v3.x"
M.event = "InsertEnter"
M.dependencies = {
  -- LSP support
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "saadparwaiz1/cmp_luasnip",
  -- Snippets
  -- https://github.com/rafamadriz/friendly-snippets#with-lazynvim
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  "stevearc/conform.nvim",
}

M.config = function()
  local lsp_zero = require("lsp-zero")

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "solargraph",
      "lua_ls",
      "ts_ls",
    },
    handlers = {
      lsp_zero.default_setup,
    },
  })

  lsp_zero.on_attach(function(client, bufnr)
    -- Opt out of semantic highlighting
    -- :h vim.lsp.semantic_tokens_start()
    client.server_capabilities.semanticTokensProvider = nil
    local opts = { buffer = bufnr }
    local map = vim.keymap.set
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    map("n", "gt", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  end)

  -- CMP
  local cmp = require("cmp")
  local cmp_action = lsp_zero.cmp_action()

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp_action.luasnip_supertab(),
      ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      ["C-f"] = cmp.mapping.scroll_docs(4),
      ["C-b"] = cmp.mapping.scroll_docs(-4),
    }),
    sources = {
      { name = "buffer" },
      { name = "path" },
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
    },
  })

  -- LuaSnip
  -- Lazy load when using LuaSnip
  -- https://github.com/rafamadriz/friendly-snippets#with-lazynvim
  require("luasnip.loaders.from_vscode").lazy_load()
  -- Add snippets from a framework to a filetype
  -- https://github.com/rafamadriz/friendly-snippets#add-snippets-from-a-framework-to-a-filetype
  require("luasnip").filetype_extend("ruby", { "rails" })
  require("luasnip").filetype_extend("eruby", { "html" })

  -- Conform, formatter
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      eruby = { "htmlbeautifier" },
    },
    formatters = {
      stylua = {
        inherit = true,
        prepend_args = {
          "--indent-type=Spaces",
          "--indent-width=2",
        },
      },
    },
    format_on_save = {
      lsp_fallback = true,
    },
  })

  -- Show line diagnostics automatically in hover window
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
  vim.diagnostic.config({ virtual_text = false })
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

return M
