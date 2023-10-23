local M = {
  'tpope/vim-fugitive'
}

M.config = function()
  -- Keymaps
  vim.keymap.set('n', 'gs', ':G<cr>:only<cr>', { silent=true })
  vim.keymap.set('n', 'gj', ':Gclog<cr>', { silent=true })
end

return M
