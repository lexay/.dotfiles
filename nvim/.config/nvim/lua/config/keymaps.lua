vim.g.mapleader = " "
keymap = vim.keymap.set
utils = require("config.utils")

-- Keymaps

-- Buffers
-- Move between buffers opened recently
keymap("n", "<leader><leader>", "<C-^>")
-- Close current buffer
keymap("n", "<leader>b", "<cmd>bdelete<cr>", { silent = true })
-- Close all buffers
keymap("n", "<leader>B", "<cmd>%bdelete<cr>", { silent = true })

-- Moving
-- Move in normal mode
-- Half window up/down with cursor staying in the middle
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-u>", "<c-u>zz")

-- Searching
-- Match is always in the middle
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "*", "*zz")
keymap("n", "#", "#zz")
keymap("n", "g*", "g*zz")
keymap("n", "g#", "g#zz")

-- Substitute in
-- Whole file
keymap("n", "<leader>si", "q:%s///gc<left><left><left><left>")
-- Whole file matching selected <cword>
keymap("v", "<leader>sw", [["cyq:%s/<c-r>c//gc<left><left><left>]])
-- Selected block
keymap("v", "<leader>si", "q:s///gc<left><left><left><left>")

-- Highlighting
-- Highlight last inserted text
keymap("n", "gV", "`[v`]")

-- Windows
-- Open vertical split
keymap("n", [[<leader>\]], "<cmd>vsplit<cr>")
-- Open horizontal split
keymap("n", "<leader>-", "<cmd>split<cr>")
-- Scale window size to max width / height / to normal
keymap("n", "<leader>)", "<cmd>vertical resize<cr>")
keymap("n", "<leader>_", "<cmd>resize<cr>")
keymap("n", "<leader>0", "<c-w>=<space><cr>")
-- Resize window width
keymap("n", "(", "<cmd>vertical resize -10<cr>")
keymap("n", ")", "<cmd>vertical resize +10<cr>")
-- Resize window height
keymap("n", "-", "<cmd>resize -10<cr>")
keymap("n", "=", "<cmd>resize +10<cr>")
-- Swap window to left / right / up / down
keymap("n", "<a-h>", "<c-w>H<cr>")
keymap("n", "<a-l>", "<c-w>L<cr>")
keymap("n", "<a-k>", "<c-w>K<cr>")
keymap("n", "<a-j>", "<c-w>J<cr>")
-- Close current window
keymap("n", "<leader>w", "<cmd>close<cr>")
-- Close all windows except current
keymap("n", "<leader>W", "<cmd>only<cr>")

-- Tabs
-- Open $MYVIMRC in new tab
keymap("n", "<leader>vrc", "<cmd>tabnew $MYVIMRC<cr><cmd>tcd %:p:h<cr><cmd>pwd<cr>")
-- Switch tabs
keymap("n", "<a-,>", "<cmd>tabprevious<cr>", { silent = true })
keymap("n", "<a-.>", "<cmd>tabnext<cr>", { silent = true })
-- Close all tabs except focused
keymap("n", "<leader>T", "<cmd>tabonly<cr>", { silent = true })
keymap("n", "<leader>t", "<cmd>tabclose<cr>", { silent = true })

-- Netrw
keymap("n", "<leader>da", "<cmd>Lexplore %:p:h<cr>")
keymap("n", "<leader>dd", "<cmd>Lexplore<cr>")

-- Other
-- Copy/paste from system clipboard
keymap("", "<leader>y", [["+y]])
keymap("", "<leader>p", [["+p]])
keymap("", "<leader>P", [["+P]])
-- Close windows faster
keymap("n", "<leader>s", "<cmd>x<cr>")
keymap("n", "<leader>q", "<cmd>q!<cr>")
keymap("n", "<leader>Q", "<cmd>qa<cr>")
-- Yank to EOL
keymap("n", "Y", "y$")
-- Join lines and jump to cursor's previous position
keymap("n", "J", "mzJ`z")
-- Change working directory
keymap("n", "<leader>a", "<cmd>cd %:p:h<cr><cmd>pwd<cr>")
-- Better keyboard switch combo
keymap({ "c", "i" }, "<a-r>", "<c-^>")
keymap({ "n" }, "<a-r>", "a<c-^><escape>")
-- Undo breaks
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", "!", "!<c-g>u")
keymap("i", "?", "?<c-g>u")
-- Change words
keymap("n", "cn", "*``cgn")
keymap("n", "cN", "*``cgN")
-- Visual select to EOL not including new line char
keymap("n", "v$", "v$<left>")
-- Unmaps
-- Interferes with discord
keymap({ "n" }, "`", "<nop>")
-- Interferes with tmux
keymap("n", "<c-z>", "<nop>")
-- Move text
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")
keymap("v", "J", [[:m '>+1<cr>gv=gv]])
keymap("v", "K", [[:m '<-2<cr>gv=gv]])
-- Choose ours/theirs diffget
keymap("n", "gh", [[<cmd>diffget /2<cr>]])
keymap("n", "gl", [[<cmd>diffget /3<cr>]])
-- Inspect for syntax tree objects
keymap("n", "<leader>k", "<cmd>Inspect<cr>")
-- Cnext, cprevious
keymap("n", "<c-n>", "<cmd>cnext<cr>")
keymap("n", "<c-p>", "<cmd>cprevious<cr>")
-- Ruby docs
keymap("n", "<leader>frbh", utils.show_ri)
keymap("n", "<leader>frbg", utils.find_ri)
-- Use cmd/search window instead
keymap("n", ":", "q:")
keymap("n", "/", "q/")
keymap("n", "?", "q?")
-- Dont block vim_tmux_navigator's <c-l> with NetrwRefresh
keymap("n", "<leader>R", "<plug>NetrwRefresh")
