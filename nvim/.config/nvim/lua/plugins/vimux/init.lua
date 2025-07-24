local M = {
  "preservim/vimux",
}

M.branch = "master"

M.config = function()
  -- Use the nearest pane for the vimux runner
  vim.g["VimuxUseNearest"] = 0
end

return M
