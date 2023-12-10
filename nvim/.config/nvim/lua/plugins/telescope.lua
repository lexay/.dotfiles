local M = {
  "nvim-telescope/telescope.nvim",
}

M.tag = "0.1.4"

M.config = function()
  require("telescope").setup({
    defaults = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
      },
      file_ignore_patterns = { ".git/", "node_modules/", "png" },
      mappings = {
        i = {
          -- Close Telescope with <escape> like all auxiliary windows
          ["<esc>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        previewer = false,
        no_ignore = true,
        theme = "dropdown",
      },
      live_grep = {
        previewer = true,
        theme = "dropdown",
      },
      buffers = {
        previewer = false,
        theme = "dropdown",
      },
      help_tags = {
        previewer = false,
        theme = "dropdown",
      },
      man_pages = {
        previewer = false,
        theme = "dropdown",
      },
    },
  })

  -- Keymaps
  keymap("n", "<leader>ff", utils.find_files)
  keymap("n", "<leader>fg", utils.live_grep)
  keymap("n", "<leader>fb", utils.buffers)
  keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
  keymap("n", "<leader>fm", "<cmd>Telescope man_pages<cr>")
end

M.dependencies = { "nvim-lua/plenary.nvim" }

return M
