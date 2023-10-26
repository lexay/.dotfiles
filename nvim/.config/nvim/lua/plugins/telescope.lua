local M = {
  "nvim-telescope/telescope.nvim", tag = "0.1.4"
}

M.config = function()
  require("telescope").setup({
    defaults = {
      find_command = {
        "rg",
        "--files",
        "--hidden"
      },
      file_ignore_patterns = { ".git/", "node_modules/", "png" },
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
        }
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        previewer = false,
        no_ignore = true,
      }
    }
  })

  -- Keymaps
  keymap('n', '<leader>ff', ':Telescope find_files<cr>')
  keymap('n', '<leader>fg', ':Telescope live_grep<cr>')
  keymap('n', '<leader>fb', ':Telescope buffers<cr>')
  keymap('n', '<leader>fh', ':Telescope help_tags<cr>')
  keymap('n', '<leader>fm', ':Telescope man_pages<cr>')
end

M.dependencies = {'nvim-lua/plenary.nvim'}

return M
