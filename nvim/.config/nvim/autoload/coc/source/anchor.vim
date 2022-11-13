" Custom autocompletion,
" see https://github.com/neoclide/coc.nvim/wiki/Create-custom-source for details
" vim source for anchor
function! coc#source#anchor#init() abort
  return {
        \ 'priority': 9,
        \ 'shortcut': 'CUSTOM',
        \ 'filetypes': ['ruby']
        \}
endfunction

function! coc#source#anchor#complete(opt, cb) abort
  let items = ['ANCHOR: ', 'ANCHOR_END: ']
  call a:cb(items)
endfunction
