local M = {
  -- "lexay/telescope-zoxide.nvim",
  dir = "~/Projects/telescope-zoxide/",
}

M.config = function()
  require("telescope").load_extension("zoxide")
end

return M
