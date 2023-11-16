-- Thanks to Heiker Curiel
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer

-- Hide banner
vim.g.netrw_banner = 0

-- Use `echoerr` for showing errors
vim.g.netrw_use_errorwindow = 0

-- Allow moving files with netrw
vim.g.netrw_keepdir = 0

-- Better navigation keymaps
-- Move
-- One level up
vim.api.nvim_buf_set_keymap(0, "n", "h", "-", {})
-- Back in history
vim.api.nvim_buf_set_keymap(0, "n", "H", "u", {})
-- Forward to the next subdir OR open a file
vim.api.nvim_buf_set_keymap(0, "n", "l", "<cr>", {})
-- Open a file AND close netrw
vim.api.nvim_buf_set_keymap(0, "n", "L", "<cr><cmd>Lexplore<cr>", {})
-- Hide/show dotfiles files
vim.api.nvim_buf_set_keymap(0, "n", ".", "gh", {})
-- Close netrw with <escape> like all auxiliary buffers
vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})

-- Better marks
-- Mark file(s)
vim.api.nvim_buf_set_keymap(0, "n", "<tab>", "mf", {})
-- Unmark file(s) in the current buffer
vim.api.nvim_buf_set_keymap(0, "n", "<s-tab>", "mF", {})
-- Unmark all marked files
vim.api.nvim_buf_set_keymap(0, "n", "<leader><tab>", "mu", {})

-- Create file, write and switch back to netrw
vim.api.nvim_buf_set_keymap(0, "n", "ff", "%<cmd>w<cr><c-w><c-p>", {})
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

-- List marked files
vim.api.nvim_buf_set_keymap(0, "n", "fl", [[<cmd>echo join(netrw#Expose("netrwmarkfilelist"), "\n")<cr>]], {})

-- Show target directory using echo if the banner is hidden
vim.api.nvim_buf_set_keymap(0, "n", "fq", [[<cmd>echo 'Target: ' . netrw#Expose("netrwmftgt")<cr>]], {})
vim.api.nvim_buf_set_keymap(0, "n", "ft", "mtfq", {})

-- Highlight marked files
vim.cmd([[hi! link netrwMarkFile Search]])
