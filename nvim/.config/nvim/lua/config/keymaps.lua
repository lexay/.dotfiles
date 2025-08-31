vim.g.mapleader = " "
local map = vim.keymap.set
local utils = require("config.utils")
local zoxide = require("plugins.telescope_zoxide")
local vimux = require("plugins.vimux")

-- Keymaps --

-- Navigation:
-- Find files
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- Grep in files
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
-- Find buffers local to CWD in buffer list
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers({only_cwd = true, sort_mru = true})<cr>")
-- Find buffers in buffer list and CD to the project directory
map("n", "<leader>fB", "<cmd>Telescope buffers_zoxide<cr>")
-- Find in :help
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- Find in unix man pages
map("n", "<leader>fm", "<cmd>Telescope man_pages<cr>")
-- Find in netrw explorer
map("n", "<leader>fd", "<cmd>Explore<cr>")
-- Find in projects
map("n", "<leader>zi", "<cmd>Telescope zoxide<cr>")
-- Add to projects
map("n", "<leader>za", zoxide.add)
-- Remove from projects
map("n", "<leader>zr", zoxide.remove)
-- Edit projects
map("n", "<leader>ze", "<cmd>tabnew term://zoxide edit<cr><insert>")

-- Versioning:
-- Git
map("n", "gs", "<cmd>tabnew<cr><cmd>G<cr><cmd>only<cr>", { silent = true })
-- Git log
map("n", "gj", "<cmd>Gclog<cr>", { silent = true })
-- Git add current file
map("n", "gA", "<cmd>Git add %<cr>", { silent = true })

-- Running files:
-- Open vimux runner
map("n", "<leader>ro", vimux.open_runner)
-- Run current file
map("n", "<leader>rr", vimux.run_cur_buf)

-- Buffers:
-- Close current buffer (but keep split open if it exists)
map("n", "<leader>b", utils.backunlist, { silent = true })
-- Close all buffers but current
map("n", "<leader>B", utils.buff_only, { silent = true })
-- Switch to previous/next local buffer
map("n", "<a-j>", utils.cycle_next_local_buf)
map("n", "<a-k>", utils.cycle_prev_local_buf)
-- Switch to previous/next quickfix entry
map("n", "<a-n>", "<cmd>silent! cnext<cr>")
map("n", "<a-p>", "<cmd>silent! cprevious<cr>")

-- Moving:
-- Move in normal mode
-- Half window up/down with cursor staying in the middle
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")

-- Searching:
-- Match is always in the middle
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "*", "*zz")
map("n", "#", "#zz")
map("n", "g*", "g*zz")
map("n", "g#", "g#zz")

-- Highlighting:
-- Highlight last inserted text
map("n", "gV", "`[v`]")

-- Windows:
-- Open new tab
map("n", "<leader>n", "<cmd>tabnew<cr>")
-- Open vertical split
map("n", "<leader>v", "<cmd>vsplit<cr>")
-- Open horizontal split
map("n", "<leader>s", "<cmd>split<cr>")
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

-- Tabs:
-- Move between tabs opened recently
map("n", "<leader><leader>", "<c-tab>")
-- Switch tabs
map("n", "<a-h>", "<cmd>tabprevious<cr>", { silent = true })
map("n", "<a-l>", "<cmd>tabnext<cr>", { silent = true })
-- Close all tabs except focused
map("n", "<leader>T", "<cmd>tabonly<cr>", { silent = true })
map("n", "<leader>t", "<cmd>tabclose<cr>", { silent = true })

-- Refactoring:
-- Navigation
map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<cr>")
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>")
map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>")
-- Renaming
-- Normal
map("n", "gn", "q:%s///gc<left><left><left><left>")
-- Visual
map("v", "gn", "q:s///gc<left><left><left><left>")
-- Quickfix
map("n", "gN", "q:cdo %s///gc<left><left><left><left>")

-- Other:
-- Copy/paste from system clipboard
map("", "<leader>y", [["+y]])
map("", "<leader>p", [["+p]])
map("", "<leader>P", [["+P]])
-- Close windows faster
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
-- Dont block vim_tmux_navigator's <c-l> with NetrwRefresh
map("n", "<leader>R", "<plug>NetrwRefresh")
-- Go to the start/end of the text
map("n", "H", "^")
map("n", "L", "$")
-- Open quickfix list
map("n", "<leader>q", "<cmd>copen<cr>")
-- Clear quickfix list
map("n", "<leader>c", utils.clear_qf)

-- Disable Ctr-Backslash
vim.keymap.set("n", "<c-bslash>", "<nop>")
-- Experimenting:
-- Discover previously not known default keys / combinations
-- Normal va %
-- Goto or create buffer
vim.keymap.set("n", "gf", utils.gf)
