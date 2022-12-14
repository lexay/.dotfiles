" -------------------------------------------------------------------- Movement:
" Jump to marks
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move to first char/end of line
nnoremap H ^
nnoremap L $

" Move text horizontally aka identing
vnoremap > >gv
vnoremap < <gv

" Move text vertically
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>
" inoremap <C-k> <Esc>:m .-2<CR>

" Change words
nnoremap cn *``cgn
nnoremap cN *``cgN

" Move between buffers opened recently
nnoremap <leader><leader> <C-^>

" Close current buffer
nnoremap <silent><leader>c :bdelete<CR>
" Close all buffers
nnoremap <silent><leader>C :%bdelete<CR>

" Move natively in command mode with Ctr-h/j/k/l
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Move to next modified buffer
nnoremap <leader>n :bmod<CR>

" Jump to first split
nnoremap <leader>1 <C-w>1000h<CR>
" Jump to last split
nnoremap <leader>2 <C-w>1000l<CR>

"--------------------------------------------------------------------- Terminal:
nnoremap <leader>ru :sp<CR>:term ruby %<CR>
" Esc to normal mode.
" tnoremap <m-esc> <C-\><C-n>
" nnoremap <leader>bd :bd!<CR>

" ------------------------------------------------------------------- TableMode:
nnoremap <leader>t :TableModeToggle<CR>

" ----------------------------------------------------------------- Undo breaks:
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap <space> <space><C-g>u

" --------------------------------------------------------------------- Windows:
" Splits
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

" Scale window size to max width/height and back
nnoremap gw :vertical resize<CR>
nnoremap gh :resize<CR>
nnoremap gn <C-w>=<Space><CR>

" Resize window width
nnoremap <A-h> :vertical resize -10<CR>
nnoremap <A-l> :vertical resize +10<CR>

" Resize window height
nnoremap <A-j> :resize -10<CR>
nnoremap <A-k> :resize +10<CR>

" Swap window to left / right / up / down
nnoremap <A-[> <C-w>H<CR>
nnoremap <A-]> <C-w>L<CR>
nnoremap <A-'> <C-w>K<CR>
nnoremap <A-/> <C-w>J<CR>

"Close all windows except focused
nnoremap <leader>W <C-w><C-o>

" -------------------------------------------------------------------- Vim Tabs:
" Open init.vim in a new tab
nnoremap <leader>vrc :tabnew $MYVIMRC<CR>
nnoremap ( :tabprevious<CR>
nnoremap ) :tabnext<CR>

" ----------------------------------------------------------------- Other stuff:

" Copy/paste from system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Close windows quicklier.
nnoremap <leader>s :x<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :qa<CR>

" Yank to EOL
nnoremap Y y$

" Ctrl-z interferes with tmux Zoom keycombo
nnoremap <C-z> <nop>

" Change working directory:
nnoremap <leader>a :cd %:p:h<CR>:pwd<CR>

" Better keyboard switch combo
cnoremap <A-r> <C-^>
inoremap <A-r> <C-^>
nnoremap <A-r> a<C-^><Esc>

" Highlight last inserted text.
nnoremap gV `[v`]

" Matches are always in the middle.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap J mzJ`z

" Substitute <pattern> for other <pattern> in search mode.
nnoremap <leader>su :%s///<left><left>
vnoremap <leader>su :s///<left><left>

" --------------------------------------------------------------------- Testing:
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <silent><leader>n :!tmux new-window tmux_sessionizer<CR>
