-- Disable netrw
vim.api.nvim_buf_set_keymap(0, "n", "<leader>dd", "<nop>", {})

-- Disable keymaps used for resizing
vim.api.nvim_buf_set_keymap(0, "n", "=", "nop", {})
vim.api.nvim_buf_set_keymap(0, "n", "-", "nop", {})
vim.api.nvim_buf_set_keymap(0, "n", "_", "nop", {})
vim.api.nvim_buf_set_keymap(0, "n", "+", "nop", {})
