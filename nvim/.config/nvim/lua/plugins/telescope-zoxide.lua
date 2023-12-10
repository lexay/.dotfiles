local M = {
  "lexay/telescope-zoxide.nvim",
}

M.config = function()
  require("telescope").load_extension("zoxide")
  keymap("n", "<leader>fz", "<cmd>Telescope zoxide<cr>")
end
return M
