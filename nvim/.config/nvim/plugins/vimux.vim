"------------------------------------------------------------------------ Vimux:
  " Check interpreter against filetype and pass it as var to :VimuxRunCommand.
  function! RunScriptWith(runners)
    if has_key(a:runners, &filetype)
      let l:runner = a:runners[&filetype]
      call VimuxRunCommand("clear; " . runner . " " . expand("%:p:S"))
    else
      echoerr 'Unable to determine runner'
    endif
  endfunction

  function! GetInterpreterRunners()
  let l:interpreter_runners =  {
        \ 'ruby': 'ruby',
        \ 'javascript': 'node',
        \ 'python': 'python',
        \ 'lua': 'lua',
        \ 'crystal': 'crystal run',
        \ }
  return interpreter_runners
  endfunction

  function! GetTestRunners()
  let l:test_runners =  {
        \ 'ruby': 'rspec --format documentation --color',
        \ 'javascript': 'npm test'
        \ }
  return test_runners
  endfunction

  function! OpenInBrowser()
    let l:browser = $BROWSER
    if browser == 'brave'
      let l:browser = browser . ' --password-store=basic '
    endif
    call VimuxRunCommand(browser . bufname("%") . " &> /dev/null" . " & disown;" . " exit")
  endfunction

  " Run current file interpreter
  map <silent><A-c> :call RunScriptWith(GetInterpreterRunners())<CR>
  " Run current test
  map <silent><A-t> :call RunScriptWith(GetTestRunners())<CR>
  " Run current file with BROWSER
  map <silent><A-e> :call OpenInBrowser()<CR>
  " Run bundled ruby apps
  map <A-b> :VimuxRunCommand("bundle exec ruby " . bufname("%"))<CR>
  " Run last command
  map <A-o> :VimuxRunLastCommand<CR>
  " Close terminal
  map <A-x> :VimuxCloseRunner<CR>
  " Dont use nearest pane, split instead.
  let g:VimuxUseNearest = 0
