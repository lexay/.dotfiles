local M = {
  'nvim-telescope/telescope.nvim',
}

M.config = function()
  require("telescope").setup({
    defaults = {
          find_command = {
            "rg",
            "--files",
            "--hidden"
          },
          file_ignore_patterns = { ".git/", "node_modules/", "png" }
    }
  })
end

M.dependencies = {'nvim-lua/plenary.nvim'}

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>')
keymap('n', '<leader>fg', ':Telescope live_grep<cr>')
keymap('n', '<leader>fb', ':Telescope buffers<cr>')
keymap('n', '<leader>fh', ':Telescope help_tags<cr>')
keymap('n', '<C-n>', '<cmd>silent !tmux new-window tmux_sessionizer<CR>')

return M
