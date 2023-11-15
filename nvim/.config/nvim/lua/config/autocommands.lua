-- Create no undofile for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.env" },
  command = "lua vim.bo.undofile = false",
})
vim.api.nvim_create_autocmd("CmdwinEnter", {
  command = "startinsert",
})
