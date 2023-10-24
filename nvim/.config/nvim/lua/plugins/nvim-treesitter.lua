local M = {
  'nvim-treesitter/nvim-treesitter'
}

M.build = { ":TSUpdate" }

M.config = function()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "ruby", "lua" },
    highlight = {
      enable = true,
    },
  }
end

return M
