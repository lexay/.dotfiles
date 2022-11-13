"---------------------------------------------------------------------- Folding:
" Default keys:
" za = toggle current fold.
" zR = open all folds.
" zM = close all folds.

"setglobal foldmethod=marker foldmarker={,} foldlevel=0 

" Focus a fold, open it and close the other.
nnoremap <leader>z zMzvzz
" Lines with equal indent form a fold.
set foldmethod=indent
" Max nested folds.
set foldnestmax=10 
" All folds are open.
set nofoldenable
" Folds with higher level will be closed.
set foldlevel=1
" Remove extra fills  -----.
" set fillchars="fold: "
" Color folds.
" hi Folded term=bold ctermfg=DarkBlue ctermbg=none
" hi Foldcolumn term=bold ctermfg=DarkBlue ctermbg=none
" Add column to the left side to indicate folding.
" set foldcolumn=1

