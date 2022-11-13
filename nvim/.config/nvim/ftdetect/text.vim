au BufRead,BufNewFile,BufEnter * call TextFormatOptions()
      " \ if empty(expand("%:e")) && expand("%:t") !~ '\.' && empty(&filetype) |
      " \ set ft=texttest cc=0 tw=180 |
      " \ endif

function TextFormatOptions()
      let ext = expand("%:e")
      let tail = expand("%:t")
      let type = &filetype

      if empty(ext) && tail !~ '\.' && empty(type) || type == 'text'
            set cc=0 tw=180
      endif
endfunction
