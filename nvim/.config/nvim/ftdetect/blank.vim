au BufRead,BufNewFile,BufEnter * call TextFormatOptions()

function TextFormatOptions()
      let file_extension = expand("%:e")
      if empty(file_extension)
            set cc=0 tw=180
      endif
endfunction
