
vim.cmd[[
  augroup CompletionTriggerCharacter
        autocmd!
        autocmd BufEnter * let g:completion_trigger_character = ['.']
        autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
  augroup end
]]

-- define an chain complete list
local chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },
  comment = {},
}

local on_attach = function()
  require'diagnostic'.on_attach()
  -- passing in a table with on_attach function
  require'completion'.on_attach({
      sorting = 'alphabet',
      matching_strategy_list = {'exact', 'fuzzy'},
      chain_complete_list = chain_complete_list,
    })
  end
