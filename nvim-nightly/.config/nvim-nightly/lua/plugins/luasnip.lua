local M = {
  'L3MON4D3/LuaSnip',
}

M.event = 'InsertEnter'

M.dependencies = { 
    'rafamadriz/friendly-snippets',
  }

M.config = function()
  require('luasnip/loaders/from_vscode').lazy_load()
  require('luasnip').filetype_extend('ruby', { 'rails' })
end

return M
