-- Hide banner
vim.g.netrw_banner = 0

-- Copy files recursivelly
vim.g.netrw_localcopycmdopt = " -R"

-- Use `echoerr` for showing errors
vim.g.netrw_use_errorwindow = 0

-- Better navigation keymaps
-- Unset default keymaps
bufmap("n", "a", "<nop>")
bufmap("n", "-", "<nop>")
bufmap("n", "%", "<nop>")
bufmap("n", "cb", "<nop>")
bufmap("n", "cB", "<nop>")
bufmap("n", "cd", "<nop>")
bufmap("n", "C", "<nop>")
bufmap("n", "<c-l>", "<nop>")
bufmap("n", "<c-r>", "<nop>")
bufmap("n", "d", "<nop>")
bufmap("n", "gb", "<nop>")
bufmap("n", "gd", "<nop>")
bufmap("n", "gf", "<nop>")
bufmap("n", "gh", "<nop>")
bufmap("n", "gn", "<nop>")
bufmap("n", "gp", "<nop>")
bufmap("n", "I", "<nop>")
bufmap("n", "i", "<nop>")
bufmap("n", "ma", "<nop>")
bufmap("n", "mA", "<nop>")
bufmap("n", "mb", "<nop>")
bufmap("n", "mB", "<nop>")
bufmap("n", "mc", "<nop>")
bufmap("n", "md", "<nop>")
bufmap("n", "me", "<nop>")
bufmap("n", "mf", "<nop>")
bufmap("n", "mF", "<nop>")
bufmap("n", "mg", "<nop>")
bufmap("n", "mh", "<nop>")
bufmap("n", "mm", "<nop>")
bufmap("n", "mr", "<nop>")
bufmap("n", "ms", "<nop>")
bufmap("n", "mT", "<nop>")
bufmap("n", "mt", "<nop>")
bufmap("n", "mu", "<nop>")
bufmap("n", "mv", "<nop>")
bufmap("n", "mx", "<nop>")
bufmap("n", "mX", "<nop>")
bufmap("n", "mz", "<nop>")
bufmap("n", "O", "<nop>")
bufmap("n", "o", "<nop>")
bufmap("n", "p", "<nop>")
bufmap("n", "P", "<nop>")
bufmap("n", "qb", "<nop>")
bufmap("n", "qf", "<nop>")
bufmap("n", "qF", "<nop>")
bufmap("n", "qL", "<nop>")
bufmap("n", "s", "<nop>")
bufmap("n", "S", "<nop>")
bufmap("n", "Tb", "<nop>")
bufmap("n", "t", "<nop>")
bufmap("n", "Th", "<nop>")
bufmap("n", "u", "<nop>")
bufmap("n", "U", "<nop>")
bufmap("n", "v", "<nop>")
bufmap("n", "x", "<nop>")
bufmap("n", "X", "<nop>")
bufmap("n", "<del>", "<nop>")
bufmap("n", "D", "<nop>")
bufmap("n", "R", "<nop>")
-- Move
-- One level up
vim.api.nvim_buf_set_keymap(0, "n", "h", "-", {})
-- Back in history
vim.api.nvim_buf_set_keymap(0, "n", "H", "u", {})
-- Forward to the next subdir OR open a file
vim.api.nvim_buf_set_keymap(0, "n", "l", "<cr>", {})
-- Hide/show dotfiles files
vim.api.nvim_buf_set_keymap(0, "n", ".", "gh", {})
-- Close netrw and return to the previous buffer
vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>Rexplore<cr>", {})

-- Better marks
-- Mark file(s)
vim.api.nvim_buf_set_keymap(0, "n", "<tab>", "mf", {})
-- Unmark file(s) in the current buffer
vim.api.nvim_buf_set_keymap(0, "n", "<s-tab>", "mF", {})
-- Unmark all marked files
vim.api.nvim_buf_set_keymap(0, "n", "<leader><tab>", "mu", {})
-- List marked files
vim.api.nvim_buf_set_keymap(0, "n", "fl", [[<cmd>echo join(netrw#Expose("netrwmarkfilelist"), "\n")<cr>]], {})
-- Copy marked files
vim.api.nvim_buf_set_keymap(0, "n", "fc", "mc", {})
-- Move marked files and refresh netrw current buffer
vim.api.nvim_buf_set_keymap(0, "n", "fx", "mm<plug>NetrwRefresh", {})
-- Move files from marked list to buffer list
vim.api.nvim_buf_set_keymap(0, "n", "fb", "cb", {})
-- Show target directory using echo (useful when the banner is hidden)
vim.api.nvim_buf_set_keymap(0, "n", "fq", [[<cmd>echo 'Target: ' . netrw#Expose("netrwmftgt")<cr>]], {})
-- Place a target on a directory for consecutive copy/move command and show that directory name as target
vim.api.nvim_buf_set_keymap(0, "n", "ft", "mtfq", {})

-- Create file, write and switch back to netrw
vim.api.nvim_buf_set_keymap(0, "n", "ff", "ft%<cmd>w<cr><c-w><c-p>", {})
-- Create directory
vim.api.nvim_buf_set_keymap(0, "n", "fF", "d", {})
-- Delete file/marked files and directory/empty directories
vim.api.nvim_buf_set_keymap(0, "n", "fd", "D", {})
-- Rename file/marked files/directory
vim.keymap.set("n", "fr", utils.rename, { buffer = 0 })
-- Rename visually highlighted files
vim.api.nvim_buf_set_keymap(0, "v", "fr", "R", {})
-- Execute external shell command on marked files
vim.api.nvim_buf_set_keymap(0, "n", "f;", "mx", {})

-- Better bookmarks
-- Create bookmark
vim.api.nvim_buf_set_keymap(0, "n", "bb", "mb", {})
-- Delete created bookmark
vim.api.nvim_buf_set_keymap(0, "n", "bd", "mB", {})
-- Go to bookmark
vim.api.nvim_buf_set_keymap(0, "n", "bl", "gb", {})

-- Highlight marked files
vim.cmd([[hi! link netrwMarkFile Search]])

-- Refresh tree
vim.api.nvim_buf_set_keymap(0, "n", "r", "<plug>NetrwRefresh", {})
