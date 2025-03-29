vim.g.mapleader = " "
local map = vim.keymap.set
local utils = require("config.utils")

-- Keymaps

-- Buffers
-- Close current buffer (keep split open)
map("n", "<leader>b", utils.backdelete, { silent = true })
-- Close all buffers but current
map("n", "<leader>B", utils.buff_only, { silent = true })
-- Switch to previous/next local buffer
map("n", "<a-j>", utils.cycle_next_local_buffer)
map("n", "<a-k>", utils.cycle_prev_local_buffer)
-- Switch to previous/next quickfix entry
map("n", "<a-n>", "<cmd>silent! cnext<cr>")
map("n", "<a-p>", "<cmd>silent! cprevious<cr>")

-- Moving
-- Move in normal mode
-- Half window up/down with cursor staying in the middle
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")

-- Searching
-- Match is always in the middle
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "*", "*zz")
map("n", "#", "#zz")
map("n", "g*", "g*zz")
map("n", "g#", "g#zz")

-- Substitute in
-- Normal
map("n", "gR", "q:%s///gc<left><left><left><left>")
-- Visual
map("v", "gR", "q:s///gc<left><left><left><left>")

-- Highlighting
-- Highlight last inserted text
map("n", "gV", "`[v`]")

-- Windows
-- Open new tab
map("n", "<leader>n", "<cmd>tabnew<cr>")
-- Open vertical split
map("n", "<leader>v", "<cmd>vsplit<cr>")
-- Open horizontal split
map("n", "<leader>x", "<cmd>split<cr>")
-- Scale window size to max width / height / both / to normal
map("n", "<leader>)", "<cmd>vertical resize<cr>")
map("n", "<leader>_", "<cmd>resize<cr>")
map("n", "<leader><leader>z", utils.maxresize)
map("n", "<leader>0", "<c-w>=<cr>")
-- Resize window width
map("n", "<a-0>", "<c-w>>")
map("n", "<a-9>", "<c-w><")
-- Resize window height
map("n", "<a-->", "<c-w>-")
map("n", "<a-=>", "<c-w>+")
-- Swap window with next/previous/bottom/top
map("n", "<a-]>", "<c-w>L<cr>")
map("n", "<a-[>", "<c-w>H<cr>")
map("n", "<a-}>", "<c-w>J<cr>")
map("n", "<a-{>", "<c-w>K<cr>")
-- Close current window
map("n", "<leader>w", "<cmd>close<cr>")
-- Close all windows except current
map("n", "<leader>W", "<cmd>only<cr>")

-- Tabs
-- Move between tabs opened recently
map("n", "<leader><leader>", "<c-tab>")
-- Switch tabs
map("n", "<a-h>", "<cmd>tabprevious<cr>", { silent = true })
map("n", "<a-l>", "<cmd>tabnext<cr>", { silent = true })
-- Close all tabs except focused
map("n", "<leader>T", "<cmd>tabonly<cr>", { silent = true })
map("n", "<leader>t", "<cmd>tabclose<cr>", { silent = true })

-- Netrw
map("n", "<leader>d", "<cmd>Explore<cr>")

-- Other
-- Copy/paste from system clipboard
map("", "<leader>y", [["+y]])
map("", "<leader>p", [["+p]])
map("", "<leader>P", [["+P]])
-- Close windows faster
map("n", "<leader>s", "<cmd>update<cr>")
map("n", "<leader>S", "<cmd>xit<cr>")
map("n", "<leader>Q", "<cmd>quitall<cr>")
-- Yank to EOL
map("n", "Y", "y$")
-- Join lines and jump to cursor's previous position
map("n", "J", "mzJ`z")
-- Change working directory
map("n", "<leader>a", "<cmd>cd %:p:h<cr><cmd>pwd<cr>")
-- Better keyboard switch combo
map({ "c", "i" }, "<a-r>", "<c-^>")
map({ "n" }, "<a-r>", "a<c-^><escape>")
-- Undo breaks
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
-- Change words
map("n", "cn", "*``cgn")
map("n", "cN", "*``cgN")
-- Visual select to EOL not including new line char
map("n", "v$", "v$<left>")
-- Unmaps
-- Interferes with discord
map({ "n" }, "`", "<nop>")
-- Interferes with tmux
map("n", "<c-z>", "<nop>")
-- Move text
map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "J", [[:m '>+1<cr>gv=gv]])
map("v", "K", [[:m '<-2<cr>gv=gv]])
-- Choose ours/theirs diffget
map("n", "gh", [[<cmd>diffget /2<cr>]])
map("n", "gl", [[<cmd>diffget /3<cr>]])
-- Inspect for syntax tree objects
map("n", "<leader>k", "<cmd>Inspect<cr>")
-- Ruby docs
map("n", "<leader>frbh", utils.show_ri)
map("n", "<leader>frbg", utils.find_ri)
-- Use cmd/search window instead
map("n", ":", "q:")
map("n", "/", "q/")
map("n", "?", "q?")
-- Dont block vim_tmux_navigator's <c-l> with NetrwRefresh
map("n", "<leader>R", "<plug>NetrwRefresh")
-- Go to the start/end of the text
map("n", "H", "^")
map("n", "L", "$")
-- Checkout default keys
-- Normal:
-- va %
-- Add/remove directory of current buffer to zoxide list
map("n", "<leader>za", utils.za)
map("n", "<leader>zr", utils.zr)
map("n", "<leader>ze", "<cmd>tabnew term://zoxide edit<cr>")

-- Open quickfix list
map("n", "<leader>q", "<cmd>copen<cr>")
-- Clear quickfix list
map("n", "<leader>c", utils.clear_qf)
