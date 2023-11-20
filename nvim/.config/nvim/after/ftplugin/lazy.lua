-- Close Lazy with <escape> like all auxiliary windows
vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})
