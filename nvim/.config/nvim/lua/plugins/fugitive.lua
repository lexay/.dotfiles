local M = {
  'tpope/vim-fugitive'
}

M.config = function()
  -- Keymaps
  keymap('n', 'gs', ':G<cr>:only<cr>', { silent=true })
  keymap('n', 'gj', ':Gclog<cr>', { silent=true })
end

return M
