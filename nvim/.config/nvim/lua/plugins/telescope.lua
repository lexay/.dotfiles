local M = {
  "nvim-telescope/telescope.nvim",
}

M.branch = "0.1.x"

M.config = function()
  require("telescope").setup({
    defaults = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
      },
      file_ignore_patterns = { "^.git/", "^node_modules/", "%.png" },
      mappings = {
        i = {
          -- Close Telescope with <escape> like all auxiliary windows
          ["<C-c>"] = false,
          ["<C-t>"] = false,
          ["<Up>"] = false,
          ["<Down>"] = false,
          ["<PageUp>"] = false,
          ["<PageDown>"] = false,
          ["<Esc>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-n>"] = require("telescope.actions").select_tab,
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
          ["<C-q>"] = require("telescope.actions").send_selected_to_qflist,
          ["<A-q>"] = require("telescope.actions").add_selected_to_qflist,
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
end

M.dependencies = { "nvim-lua/plenary.nvim" }

return M
