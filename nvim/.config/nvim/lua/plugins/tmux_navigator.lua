local M = {
  "christoomey/vim-tmux-navigator",
}

M.config = function()
  keymap("n", "<c-bslash>", "<nop>")
end

return M
