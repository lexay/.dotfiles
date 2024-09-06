vim.go.modelines = 0

local o = vim.opt

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
o.cmdheight = 1
o.cmdwinheight = 1
o.updatetime = 250
o.lazyredraw = true
o.clipboard = "unnamed"
o.hidden = true
o.mouse = "a"
o.confirm = true

o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 200

o.switchbuf = "useopen"

o.undofile = true
o.undodir = vim.env.HOME .. "/.local/share/nvim/undodir"

o.fileencodings = "ucs-bom,utf-8,default,cp1251,latin1"

o.keymap = "russian-jcukenwin"
o.iminsert = 0
o.imsearch = 0

o.number = true
o.relativenumber = true

o.scrolloff = 8
o.sidescroll = 0

o.wildmode = "longest,list,full"
o.showmatch = true

o.list = true
o.listchars = "tab:»/,trail:·,extends:>,precedes:<,nbsp:_,eol:¬"

o.wrap = false
o.showmode = false
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.wrapscan = false
o.syntax = "on"
o.shortmess:append("cI")
o.completeopt = "menuone,noselect"
o.signcolumn = "yes"
o.iskeyword:append("-,&")

o.termguicolors = true
o.background = "dark"

vim.cmd([[colorscheme habamax]])

-- Disable presetting keymaps
vim.g.no_plugin_maps = 1
