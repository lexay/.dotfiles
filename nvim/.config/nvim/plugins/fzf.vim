"-------------------------------------------------------------------------- FZF:
  let g:rg_derive_root='true'
  let $FZF_DEFAULT_COMMAND="rg --files --smart-case --hidden --glob '!.git'"
  let $FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
  nnoremap <leader>ff :Files<CR>
  " Find word under cursor
  nnoremap <leader>ftw :Rg <C-R>=expand("<cword>")<CR><CR>
  nnoremap <leader>fw :Rg<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>l :BLines<CR>
  nnoremap <leader>ll :Lines<CR>

