-- Close Mason with <escape> like all auxiliary buffers
vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})
