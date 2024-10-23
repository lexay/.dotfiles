vim.g.mapleader = " "
keymap = vim.keymap.set
utils = require("config.utils")

-- Keymaps

-- Buffers
-- Close current buffer
keymap("n", "<leader>b", "<cmd>bdelete<cr>", { silent = true })
-- Close all buffers but current
keymap("n", "<leader>B", utils.buff_only, { silent = true })
-- Switch to previous/next local buffer
keymap("n", "<a-j>", utils.cycle_next_local_buffer)
keymap("n", "<a-k>", utils.cycle_prev_local_buffer)

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
-- Normal
keymap("n", "gR", "q:%s///gc<left><left><left><left>")
-- Visual
keymap("v", "gR", "q:s///gc<left><left><left><left>")

-- Highlighting
-- Highlight last inserted text
keymap("n", "gV", "`[v`]")

-- Windows
-- Open vertical split
keymap("n", "<leader>v", "<cmd>vsplit<cr>")
-- Open horizontal split
keymap("n", "<leader>x", "<cmd>split<cr>")
-- Open tab
keymap("n", "<leader>c", "<cmd>tabnew<cr>")
-- Scale window size to max width / height / to normal
keymap("n", "<leader>)", "<cmd>vertical resize<cr>")
keymap("n", "<leader>_", "<cmd>resize<cr>")
keymap("n", "<leader>0", "<c-w>=<space><cr>")
-- Resize window width
keymap("n", "<a-0>", "<c-w>>")
keymap("n", "<a-9>", "<c-w><")
-- Resize window height
keymap("n", "<a-->", "<c-w>-")
keymap("n", "<a-=>", "<c-w>+")
-- Swap window with next/previous/bottom/top
keymap("n", "<a-]>", "<c-w>L<cr>")
keymap("n", "<a-[>", "<c-w>H<cr>")
keymap("n", "<a-}>", "<c-w>J<cr>")
keymap("n", "<a-{>", "<c-w>K<cr>")
-- Close current window
keymap("n", "<leader>w", "<cmd>close<cr>")
-- Close all windows except current
keymap("n", "<leader>W", "<cmd>only<cr>")

-- Tabs
-- Move between tabs opened recently
keymap("n", "<leader><leader>", "<c-tab>")
-- Switch tabs
keymap("n", "<a-h>", "<cmd>tabprevious<cr>", { silent = true })
keymap("n", "<a-l>", "<cmd>tabnext<cr>", { silent = true })
-- Close all tabs except focused
keymap("n", "<leader>T", "<cmd>tabonly<cr>", { silent = true })
keymap("n", "<leader>t", "<cmd>tabclose<cr>", { silent = true })

-- Netrw
keymap("n", "<leader>dd", "<cmd>Explore<cr>")

-- Other
-- Copy/paste from system clipboard
keymap("", "<leader>y", [["+y]])
keymap("", "<leader>p", [["+p]])
keymap("", "<leader>P", [["+P]])
-- Close windows faster
keymap("n", "<leader>s", "<cmd>update<cr>")
keymap("n", "<leader>S", "<cmd>xit<cr>")
keymap("n", "<leader>Q", "<cmd>quitall<cr>")
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
-- Switch to previous/next quickfix entry
keymap("n", "<a-n>", "<cmd>cnext<cr>")
keymap("n", "<a-p>", "<cmd>cprevious<cr>")
-- Ruby docs
keymap("n", "<leader>frbh", utils.show_ri)
keymap("n", "<leader>frbg", utils.find_ri)
-- Use cmd/search window instead
keymap("n", ":", "q:")
keymap("n", "/", "q/")
keymap("n", "?", "q?")
-- Dont block vim_tmux_navigator's <c-l> with NetrwRefresh
keymap("n", "<leader>R", "<plug>NetrwRefresh")
-- Go to the start/end of the text
keymap("n", "H", "^")
keymap("n", "L", "$")
-- Checkout default keys
-- Normal:
-- va %
-- Add/remove directory of current buffer to zoxide list
keymap("n", "<leader>za", utils.za)
keymap("n", "<leader>zr", utils.zr)
keymap("n", "<leader>ze", "<cmd>tabnew term://zoxide edit<cr>")

-- Close quickfix list
keymap("n", "<leader>qq", "<cmd>copen<cr>")
keymap("n", "<leader>qx", "<cmd>cclose<cr>")
