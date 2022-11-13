vim.g.mapleader = ' '

-- Keymaps

keymap('n', '<c-h>', '<c-w>h')
keymap('n', '<c-j>', '<c-w>j')
keymap('n', '<c-k>', '<c-w>k')
keymap('n', '<c-l>', '<c-w>l')

-- Match is always in the middle
keymap('n', 'n', 'nzz')
keymap('n', 'N', 'Nzz')
keymap('n', '*', '*zz')
keymap('n', '#', '#zz')
keymap('n', 'g*', 'g*zz')
keymap('n', 'g#', 'g#zz')
keymap('n', 'J', 'mzJ`z')

-- Substitute match
keymap('n', '<leader>su', ':%s///<left><left>', {})
keymap('v', '<leader>su', ':s///<left><left>', {})

-- Undo breaks
keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', '!', '!<c-g>u')
keymap('i', '?', '?<c-g>u')

-- Highlight last inserted text
keymap('n', 'gV', '`[v`]')

-- Keep indenting text with '<>' but not with '.'
keymap('v', '>', '>gv')
keymap('v', '<', '<gv')
-- Move text
keymap('v', 'J', ":m '>+1<cr>gv=gv")
keymap('v', 'K', ":m '<-2<cr>gv=gv")
-- keymap('i', '<c-j>', '<esc>:m .+1<cr>')
-- keymap('i', '<c-k>', '<esc>:m .-2<cr>')
keymap('n', '<leader>j', ':m .+1<cr>==')
keymap('n', '<leader>k', ':m .-2<cr>==')

-- Change words
keymap('n', 'cn', '*``cgn')
keymap('n', 'cN', '*``cgN')

-- Scale window size to max width / height / to normal
keymap('n', 'gw', ':vertical resize<cr>')
keymap('n', 'gh', ':resize<cr>')
keymap('n', 'gn', '<c-w>=<space><cr>')

-- Resize window width
keymap('n', '<a-h>', ':vertical resize -10<cr>')
keymap('n', '<a-l>', ':vertical resize +10<cr>')

-- Resize window height
keymap('n', '<a-j>', ':resize -10<cr>')
keymap('n', '<a-k>', ':resize +10<cr>')

-- Swap window to left / right / up / down
keymap('n', '<a-[>', '<c-w>H<cr>')
keymap('n', '<a-]>', '<c-w>L<cr>')
keymap('n', "<a-'>", '<c-w>K<cr>')
keymap('n', "<a-/>", '<c-w>J<cr>')

-- Close all windows except focused
keymap('n', '<leader>co', '<c-w><c-o>')

-- Open $MYVIMRC in new tab
keymap('n', '<leader>vrc', ':tabnew $MYVIMRC<cr>')

-- Switch tabs
keymap('n', '(', ':tabprevious<cr>')
keymap('n', ')', ':tabnext<cr>')

-- Copy / paste from system clipboard
keymap('n', '<leader>y', [["+y]])
keymap('v', '<leader>y', [["+y]])
keymap('n', '<leader>p', [["+p]])
keymap('v', '<leader>P', [["+P]])

-- Close windows faster
keymap('n', '<leader>x', ':q!<cr>')

-- Change working directory
keymap('n', '<leader>a', ':cd %:p:h<cr>:pwd<cr>')

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>')
keymap('n', '<leader>fg', ':Telescope live_grep<cr>')
keymap('n', '<leader>fb', ':Telescope buffers<cr>')
keymap('n', '<leader>fh', ':Telescope help_tags<cr>')

-- ====================================================================CMP
-- keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- keymap('i', '<c-j>', '<cmd>lua vim.call("vsnip#expand")<cr>')
-- keymap('i', '<c-l>', '<cmd>lua vim.call("vsnip#jump-next")<cr>')
