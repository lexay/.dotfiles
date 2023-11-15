-- Thanks to Heiker Curiel
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer

vim.g.netrw_banner = 0

-- Allow moving files with netrw
vim.g.netrw_keepdir = 0

-- Better navigation keymaps
vim.api.nvim_buf_set_keymap(0, "n", "h", "-", {})
vim.api.nvim_buf_set_keymap(0, "n", "H", "u", {})
vim.api.nvim_buf_set_keymap(0, "n", "l", "<cr>", {})
vim.api.nvim_buf_set_keymap(0, "n", "L", "<cr><cmd>Lexplore<cr>", {})
vim.api.nvim_buf_set_keymap(0, "n", ".", "gh", {})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>dd", "<cmd>Lexplore<cr>", {})

-- Better marks
vim.api.nvim_buf_set_keymap(0, "n", "<tab>", "mf", {})
vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "mF", {})
vim.api.nvim_buf_set_keymap(0, "n", "<s-tab>", "mu", {})

-- Create file, write and switch back to netrw
vim.api.nvim_buf_set_keymap(0, "n", "ff", "%:w<cr><c-w><c-p>", {})
vim.api.nvim_buf_set_keymap(0, "n", "fd", "D", {})
vim.api.nvim_buf_set_keymap(0, "n", "fr", "R", {})
vim.api.nvim_buf_set_keymap(0, "n", "fc", "mc", {})
-- Refresh file list in the current `netrw` buffer, countering changes not being shown in the working dir
vim.api.nvim_buf_set_keymap(0, "n", "fx", "mm<plug>NetrwRefresh", {})
vim.api.nvim_buf_set_keymap(0, "n", "f;", "mx", {})

-- Better bookmarks
vim.api.nvim_buf_set_keymap(0, "n", "bb", "mb", {})
vim.api.nvim_buf_set_keymap(0, "n", "bd", "mB", {})
vim.api.nvim_buf_set_keymap(0, "n", "bl", "gb", {})

vim.api.nvim_buf_set_keymap(0, "n", "fl", [[<cmd>echo join(netrw#Expose("netrwmarkfilelist"), "\n")<cr>]], {})

-- Show target directory without the banner
vim.api.nvim_buf_set_keymap(0, "n", "fq", [[<cmd>echo 'Target: ' . netrw#Expose("netrwmftgt")<cr>]], {})
vim.api.nvim_buf_set_keymap(0, "n", "ft", "mtfq", {})

-- Highlight marked files
vim.cmd([[hi! link netrwMarkFile Search]])
