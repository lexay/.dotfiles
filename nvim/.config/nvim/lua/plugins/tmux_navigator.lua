local M = {
  "christoomey/vim-tmux-navigator",
}

M.config = function()
  local map = vim.keymap.set
  map("n", "<c-bslash>", "<nop>")
end

return M
