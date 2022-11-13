"====================================================== Conqueror of Completion:
" Extensions that will be automatically installed on startup
  let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-emmet',
        \ 'coc-json',
        \ 'coc-prettier',
        \ 'coc-snippets',
        \ 'coc-solargraph',
        \ 'coc-tsserver',
        \ ]

  " Show documentation for methods
  nnoremap <silent> K :call <SID>show_documentation()<cr>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    endif
  endfunction

  " Scroll up/down documentation
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif


  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Close preview window when completion is done
  " autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" -------------------------------------------------------------------- Snippets:
  " Use Tab for snippets
  let g:coc_snippet_next = '<tab>'
  let g:coc_snippet_prev = '<S-tab>'
  " Use Ctl-l for trigger snippet expand
  imap <C-l> <Plug>(coc-snippets-expand)
  " Use Ctl-j for select text for visual placeholder of snippet
  vmap <C-j> <Plug>(coc-snippets-select)
  " Use Ctl-j for both expand and jump (make expand higher priority)
  imap <C-j> <Plug>(coc-snippets-expand-jump)

  " Use ctrl+space to trigger completion
  inoremap <silent><expr> <C-space> coc#refresh()

" ----------------------------------------------------------------- Refactoring:
  " Locate method definition/references/implementation/type-definition
  nmap <silent> <leader>de <Plug>(coc-definition)
  nmap <silent> <leader>re <Plug>(coc-references)
  nmap <silent> <leader>im <Plug>(coc-implementation)
  nmap <silent> <leader>ty <Plug>(coc-type-definition)

  " Rename all instances of WORD under cursor in current buffer.
  nmap <leader>rn <Plug>(coc-rename)
  " Find all occurencies of WORD under cursor and refactor it.
  nnoremap <leader>rf :CocSearch <C-R>=expand("<cword>")<CR><CR>
