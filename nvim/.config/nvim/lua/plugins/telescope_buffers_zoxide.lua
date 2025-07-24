local M = {
  dir = "~/Projects/telescope-buffers-zoxide/",
}

-- M.dependencies = { "lexay/telescope-zoxide.nvim" }

M.config = function()
  require("telescope").load_extension("buffers_zoxide")
end

return M
