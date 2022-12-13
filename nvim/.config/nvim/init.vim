"======================================================================== Notes:
"
"  Quick info on the build.
"
"  This IDE wanna-be build consists of:
"
"  * tmux, a tool, that allows window / pane management, session control and
"  pair programming.
"
"  * neovim, a text editor, revolving around editing with keyboard control
"  mainly and thus utilizing its enumerous shortcuts. Keep your arms on the
"  homerow and stay calm! :-)
"
"  * CoC, Conqueror of Completion, a serious LSP for neovim(vim). It does fancy
"  stuff like linting, brings up documentation and helps refactoring
"  code.
"
"  * Vimux executes your code in a tmux terminal with the snap of a finger.
"
"  * Tim Pope's vim-fugitive is a git-like tool, that tracks any changes made in
"  your project and shows them to the user inside neovim(vim) plus much more.
"
"  * fzf and Rg for command line style search across the whole system.
"
"  Neovim is very flexible and can be extended with a lot of different
"  stuff like color schemes, bars, highlighting, template engines, other
"  languages support and much more useful little things.
"
"  Tips:
"
"  * VIMRC can be reloaded with :so(urce) %(current file), :so %MYVIMRC.
"  * Use shift+d/shift+c to delete/change till end of line.
"  * If displaying lines is slow, use SET SYNMAXCOL with lower value
"    (default=3000).
"  * Change default functionality remapping default keys, add new one with
"    <leader>.
"  * Digrpahs for symbols.
"  * Writing vimscripts tutorial :h usr_41.txt.
"  * gf / gF for editing the file under cursor, mnemonic: 'go to file'
"  * gm for moving to the middle of the line
"  * ';' for repeating t/T and f/F actions linewise, ',' for backwards.
"  * iw/is/ip/ib/iB and aw/as/ap/ab/aB
"  * [[ ]] moving between sections like ### in markdown
"  * g/pattern/t:number - copy lines to a line
"  * gt/gT or 2gt - switch tabs
"  * gi jumps back to the last insert mode position and enters it immideately.
"  * Ctrl-a/Ctrl-x for incrementing/decrementing number.
"  * Ctrl-v for visual block, Shift-g for selecting row, and finally gCtrl-a for
"    incrementing numeric values.
"
"  TODO:
"  Check include and find(fuzzy)
"  tpope/vim-dadbod #db tool
"  tpope/vim-vividchalk #colorscheme
"  tpope/vim-dispatch #tests and compiled processes in separate window

"======================================================================== Basic:
  "Not compatible with vi. Must be first line.
  set nocompatible
  " Check no modelines to prevent execution of malicious code via vim.
  set modelines=0
  " Assigning a leader key for more combos.
  let mapleader=' '

"====================================================================== Plugins:
  " Plugin Managment Powered by Vim-Plug

  " Plug autoinstall
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.local/share/nvim/plugged')

   Plug 'airblade/vim-gitgutter'

   " Run code in a tmux pane
   Plug 'benmills/vimux'

   Plug 'christoomey/vim-tmux-navigator'
   " Plug 'christoomey/vim-tmux-runner'

   Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

   Plug 'honza/vim-snippets'

   " Markdown previewer in your browser
   Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install()}, 
         \ 'for': 'markdown'}

   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

   Plug 'junegunn/fzf.vim'

   Plug 'junegunn/gv.vim'

   " Gruvbox colorscheme
   Plug 'morhetz/gruvbox'

   " Conqueror of Completion, autocompletion LSP by neoclide
   Plug 'neoclide/coc.nvim', {'branch': 'release'}

   " Polyglot
   Plug 'sheerun/vim-polyglot'

   Plug 'tpope/vim-commentary'

   Plug 'tpope/vim-dispatch'

   " End methods automatically in Ruby
   Plug 'tpope/vim-endwise'

   " Rename, move, make files and dirs
   Plug 'tpope/vim-eunuch'

   " Wrapper around Git in vim
   Plug 'tpope/vim-fugitive'

   Plug 'tpope/vim-rails', { 'for': 'ruby' }

   Plug 'tpope/vim-surround'

   Plug 'tpope/vim-unimpaired'

   Plug 'vim-airline/vim-airline'

   " Ruby config & compile within vim
   " Plug 'vim-ruby/vim-ruby' 

  call plug#end()


  " Load plugin settings, options, colorscheme etc.:
  let b:file_list = split(globpath('~/.config/nvim/settings', '*.vim'), '\n')
  let b:file_list += split(globpath('~/.config/nvim/plugins', '*.vim'), '\n')
  for file_path in b:file_list
    exe 'source' file_path
  endfor

