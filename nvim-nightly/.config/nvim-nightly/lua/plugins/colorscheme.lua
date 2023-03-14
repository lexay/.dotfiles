local M = {
"ellisonleao/gruvbox.nvim",
}

M.config = function()
  require("gruvbox").setup({
    contrast = "hard",
    inverse = true,
    overrides = {
      ['@parameter'] = { fg = "#ebdbb2" },
      ['@punctuation.bracket'] = { fg = "#ebdbb2" },
      ['@punctuation.delimiter'] = { fg = "#ebdbb2" },
      ['@operator'] = { fg = "#ebdbb2" },
      ['@punctuation.special'] = { fg = "#ebdbb2" },
      ['@variable.global'] = { fg = "#83a598" },
      ['@label'] = { fg = "#83a598" },
    },
  })
  vim.cmd("colorscheme gruvbox")
end

return M
