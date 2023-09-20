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
nnoremap <leader>d :bdelete<CR>
" Close all buffers
nnoremap <leader>D :%bdelete<CR>

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
nnoremap <leader>) :vertical resize<CR>
nnoremap <leader>_ :resize<CR>
nnoremap <leader>= <C-w>=<Space><CR>

" Resize active window width
nnoremap ( :vertical resize -10<CR>
nnoremap ) :vertical resize +10<CR>

" Resize active window height
nnoremap _ :resize -10<CR>
nnoremap + :resize +10<CR>

" Swap window to left / right / up / down
nnoremap <A-h> <C-w>H<CR>
nnoremap <A-l> <C-w>L<CR>
nnoremap <A-k> <C-w>K<CR>
nnoremap <A-j> <C-w>J<CR>

"Close all windows except focused
nnoremap <leader>W <C-w><C-o>

" ------------------------------------------------------------------------ Tabs:
" Open init.vim in a new tab
nnoremap <silent><leader>vrc :tabnew $MYVIMRC<CR>

" Switch between tabs
nnoremap <silent><A-,> :tabprevious<CR>
nnoremap <silent><A-.> :tabnext<CR>

" Close all tabs except focused
nnoremap <silent><leader>t :tabonly<CR>

" ----------------------------------------------------------------- Other stuff:
" Copy/paste from system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Close windows quicklier.
nnoremap <leader>s :x<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :qa<CR>

" Yank to EOL
nnoremap Y y$

" Ctrl-z interferes with tmux Zoom keycombo
nnoremap <C-z> <nop>

" Change working directory:
nnoremap <leader>a :tcd %:p:h<CR>:pwd<CR>

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

" Visual select to EOL not including new line char
nnoremap v$ v$<left>

" --------------------------------------------------------------------- Testing:
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <leader><leader>n :!tmux new-window fzf_tmux_sessions<CR>
