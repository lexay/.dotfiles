" Quickfix list
let g:my_qf_g = 0

function! ToggleQuickfixList()
  if g:my_qf_g == 1
    let g:my_qf_g = 0
    cclose
  else
    let g:my_qf_g = 1
    copen
  endif
endfunction

nnoremap <leader>q :call ToggleQuickfixList()<CR>
nnoremap <leader>. :cnext<CR>
nnoremap <leader>, :cprev<CR>
