"------------------------------------------------------------------------ Vimux:
  " Check interpreter against filetype and pass it as var to :VimuxRunCommand.
  function! RunScriptWith(runners)
    if has_key(a:runners, &filetype)
      let runner = a:runners[&filetype]
      call VimuxRunCommand("clear; " . runner . " " . expand("%:p:S"))
    else
      echoerr 'Unable to determine runner'
    endif
  endfunction

  function! GetInterpreterRunners()
  let interpreter_runners =  {
        \ 'ruby': 'ruby',
        \ 'javascript': 'node',
        \ 'python': 'python',
        \ 'lua': 'lua',
        \ 'crystal': 'crystal run',
        \ 'html': '$BROWSER'
        \ }
  return interpreter_runners
  endfunction

  function! GetTestRunners()
  let test_runners =  {
        \ 'ruby': 'rspec --format documentation --color',
        \ 'javascript': 'npm test'
        \ }
  return test_runners
  endfunction

  " Run current file interpreter
  map <silent><A-c> :call RunScriptWith(GetInterpreterRunners())<CR>
  " Run current test
  map <silent><A-t> :call RunScriptWith(GetTestRunners())<CR>
  " Close terminal
  map <A-x> :VimuxCloseRunner<CR>
  " Run bundled ruby apps
  map <A-b> :VimuxRunCommand("bundle exec ruby " . bufname("%"))<CR>
  " Run last command
  map <A-o> :VimuxRunLastCommand<CR>
  " Dont use nearest pane, split instead.
  let g:VimuxUseNearest = 0
