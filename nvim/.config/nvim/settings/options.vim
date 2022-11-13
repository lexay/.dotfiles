"---------------------------------------------------------------------- General:

  " Remove intro message when VIM is started. 
  set shortmess+=c
  " Allow loading plugin and ident files based on filetype.
  filetype plugin indent on
  " Syntax highlighting; SEE IMRPORTANT section for details.
  syntax enable
  set noswapfile
  set nobackup
  set nowritebackup
  set history=50
  set updatetime=50
  set lazyredraw
  " Hide buffers instead of closing them
  set hidden
  " Yank and paste with the system clipboard
  " set clipboard=unnamedplus
  set cmdheight=2
  set confirm
  " set mouse=a
  set nostartofline
  set notimeout ttimeout ttimeoutlen=200
  set switchbuf=useopen
  set undodir=~/.vim/undodir
  set undofile

"-------------------------------------------------------------------- Languages:
  " Allow reading Windows-1251 (cp1251; Cyrillic) & others
  " (Win-..../cp..../.etc) encoded files.
  " 'cp1251' is put before (NOT after) 'latin1' because 'latin1' always
  " takes over & thats why vim usually doesnt read files in cp1251 correctly. 
  set fileencodings=ucs-bom,utf-8,default,cp1251,latin1
  " Enable support for your mappings when using other than English languages.
  " Ctl-^ to switch between languages when in insertm/commandm/searchm.
  " Ctl-^ Can be remapped.
  " Keymap settings:
  " keymap=language_set triggers 'iminsert' and 'imsearch' to be '1' by default,
  " e.g.: in case keymap=russian-jcukenwin, English is '0', Russian is '1',
  " to use English by default in insertm/commandm/searchm set iminsert and
  " imsearch to 0:
  set keymap=russian-jcukenwin
  set iminsert=0
  set imsearch=0

"-------------------------------------------------------- Spaces, tabs, indents:
  set smartindent
  set expandtab               " Tabs are spaces.
  set tabstop=2               " Number of visual spaces per tab.
  set softtabstop=2           " Number of spaces in tab when editing.
  set shiftwidth=2            " Number of spaces for identing.
  set shiftround              " Round indent to multiple of 'shiftwidth'.

"--------------------------------------------------------- UI Config/Formatting:
  set number relativenumber   " Number + relative line number on each line.
  set showcmd                 " Show cmd in bottom bar.
  set wildmenu                " Command line autocompletion.
  set wildmode=longest,list,full
  set showmatch               " Highlight matching [{()}].
  set scrolloff=8             " 8 lines cursor offset from top/bottom.
  " Display non printable chars.
  set list listchars=tab:»/,trail:·,extends:>,precedes:<,nbsp:_,eol:¬
  set nowrap                  " Dont wrap long lines.
  set sidescroll=0            " Ease scrolling sideways for very long lines.
  set noshowmode
  set signcolumn=yes

  " Dont wrap long lines for now.
  " set linebreak             " Dont break words while wrapping.
  " Show linebreak as char.
  " if has("linebreak")
  "     let &showbreak = nr2char(8618)." "
  " endif
  " Format selection instead of going to Ex mode.
  map Q gq

"-------------------------------------------------------------------- Searching:
  " Highlighting.
  set nohlsearch              " Dont highlight all matches.
  set incsearch               " Show pattern, while typing search command.
  set ignorecase              " Case insensitive search. 
  set smartcase               " Case sensitive if <pat> upper case and is typed.

  " Stop searching forwards / backwards when at EOF / BOF
  set nowrapscan

  set iskeyword+=-,&
  set splitright
