-- Create no undofile for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.env" },
  command = "lua vim.bo.undofile = false",
})
-- Drop in insert mode immideatelly when in cmd/search window
vim.api.nvim_create_autocmd("CmdwinEnter", {
  command = "startinsert",
})
-- Close cmd/search windo with <escape> like all auxiliary buffers
vim.api.nvim_create_autocmd("CmdwinEnter", {
  command = [[lua vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})]],
})
