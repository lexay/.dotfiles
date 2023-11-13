-- Allow moving files with netrw
vim.g.netrw_keepdir = 0

-- Better keymaps for netrw
vim.api.nvim_buf_set_keymap(0, "n", "H", "u", {})
vim.api.nvim_buf_set_keymap(0, "n", "h", "-", {})
vim.api.nvim_buf_set_keymap(0, "n", "l", "<cr>", {})
vim.api.nvim_buf_set_keymap(0, "n", ".", "gh", {})

-- Open file in a vsplit and close netrw immideatelly
vim.api.nvim_buf_set_keymap(0, "n", "L", "<cr><cmd>Lexplore<cr>", {})
