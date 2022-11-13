local o = vim.opt

vim.o.modelines = 0

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.shiftround = true

o.swapfile = false
o.backup = false
o.writebackup = false

o.history = 50
o.cmdheight =  2
o.updatetime = 50
o.lazyredraw = true
o.clipboard = 'unnamed'
o.hidden = true
o.mouse = 'a'
o.confirm = true

o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 200

o.switchbuf = 'useopen'

o.keymap = 'russian-jcukenwin'
o.iminsert = 0
o.imsearch = 0

o.number = true
o.relativenumber = true

o.scrolloff = 8
o.sidescroll = 0

o.wildmode = 'longest,list,full'
o.showmatch = true

o.list = true
o.listchars = 'tab:»/,trail:·,extends:>,precedes:<,nbsp:_,eol:¬'

o.wrap = false
o.showmode = false
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.wrapscan = false
o.syntax = 'on'
o.shortmess:append('c')
o.completeopt = 'menuone,noselect'
o.signcolumn = 'yes'

o.termguicolors = true
vim.g.gruvbox_invert_selection = 0
vim.g.colors_name = 'gruvbox'
o.background = 'dark'
