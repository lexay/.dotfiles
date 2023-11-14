vim.g.mapleader = " "
keymap = vim.keymap.set
utils = require("config.utils")

-- Keymaps

-- Buffers
-- Move between buffers opened recently
keymap("n", "<leader><leader>", "<C-^>")
-- Close current buffer
keymap("n", "<leader>b", ":bdelete<cr>", { silent = true })
-- Close all buffers
keymap("n", "<leader>B", ":%bdelete<cr>", { silent = true })

-- Moving
-- Move in command/search mode
-- By one character
keymap("c", "<c-l>", "<right>")
keymap("c", "<c-h>", "<left>")
keymap("c", "<c-j>", "<down>")
keymap("c", "<c-k>", "<up>")
-- By one word with
keymap("c", "<a-l>", "<s-right>")
keymap("c", "<a-h>", "<s-left>")
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
keymap("n", "<leader>si", ":%s///gc<left><left><left><left>")
-- Whole file matching selected <cword>
keymap("v", "<leader>sw", [["cy:%s/<c-r>c//gc<left><left><left>]])
-- Selected block
keymap("v", "<leader>si", ":s///gc<left><left><left><left>")

-- Highlighting
-- Highlight last inserted text
keymap("n", "gV", "`[v`]")

-- Windows
-- Open vertical split
keymap("n", [[<leader>\]], ":vsplit<cr>")
-- Open horizontal split
keymap("n", "<leader>-", ":split<cr>")
-- Scale window size to max width / height / to normal
keymap("n", "<leader>)", ":vertical resize<cr>")
keymap("n", "<leader>_", ":resize<cr>")
keymap("n", "<leader>0", "<c-w>=<space><cr>")
-- Resize window width
keymap("n", "(", ":vertical resize -10<cr>")
keymap("n", ")", ":vertical resize +10<cr>")
-- Resize window height
keymap("n", "-", ":resize -10<cr>")
keymap("n", "=", ":resize +10<cr>")
-- Swap window to left / right / up / down
keymap("n", "<a-h>", "<c-w>H<cr>")
keymap("n", "<a-l>", "<c-w>L<cr>")
keymap("n", "<a-k>", "<c-w>K<cr>")
keymap("n", "<a-j>", "<c-w>J<cr>")
-- Close current window
keymap("n", "<leader>w", ":close<cr>")
-- Close all windows except current
keymap("n", "<leader>W", ":only<cr>")

-- Tabs
-- Open $MYVIMRC in new tab
keymap("n", "<leader>vrc", ":tabnew $MYVIMRC<cr> :tcd %:p:h<cr>:pwd<cr>")
-- Switch tabs
keymap("n", "<a-,>", ":tabprevious<cr>", { silent = true })
keymap("n", "<a-.>", ":tabnext<cr>", { silent = true })
-- Close all tabs except focused
keymap("n", "<leader>T", ":tabonly<cr>", { silent = true })
keymap("n", "<leader>t", ":tabclose<cr>", { silent = true })

-- Netrw
keymap("n", "<leader>dd", ":Lexplore %:p:h<cr>")
keymap("n", "<leader>dw", ":Lexplore<cr>")

-- Other
-- Copy / paste from system clipboard
keymap("n", "<leader>y", [["+y]])
keymap("v", "<leader>y", [["+y]])
keymap("n", "<leader>p", [["+p]])
keymap("v", "<leader>P", [["+P]])
-- Close windows faster
keymap("n", "<leader>s", ":x<cr>")
keymap("n", "<leader>q", ":q!<cr>")
keymap("n", "<leader>Q", ":qa<cr>")
-- Yank to EOL
keymap("n", "Y", "y$")
-- Join lines and jump to cursor's previous position
keymap("n", "J", "mzJ`z")
-- Change working directory
keymap("n", "<leader>a", ":cd %:p:h<cr>:pwd<cr>")
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
-- Preserve copied
keymap("x", "<leader>p", [["_dP]])
-- Move text
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")
keymap("v", "J", [[:m '>+1<cr>gv=gv]])
keymap("v", "K", [[:m '<-2<cr>gv=gv]])
-- Choose ours/theirs diffget
keymap("n", "gh", [[:diffget /2<cr>]])
keymap("n", "gl", [[:diffget /3<cr>]])
-- Inspect for syntax tree objects
keymap("n", "<leader>k", ":Inspect<cr>")
-- Cnext, cprevious
keymap("n", "<c-n>", "<cmd>cnext<cr>")
keymap("n", "<c-p>", "<cmd>cprevious<cr>")
-- Ruby docs
keymap("n", "<leader>frbh", utils.show_ri)
keymap("n", "<leader>frbg", utils.find_ri)
