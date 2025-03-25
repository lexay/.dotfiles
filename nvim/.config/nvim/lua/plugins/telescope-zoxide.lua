local M = {
  -- "lexay/telescope-zoxide.nvim",
  dir = "~/Projects/telescope-zoxide/",
}

M.config = function()
  require("telescope").load_extension("zoxide")
  local map = vim.keymap.set
  map("n", "<leader>fz", "<cmd>Telescope zoxide<cr>")
end
return M
