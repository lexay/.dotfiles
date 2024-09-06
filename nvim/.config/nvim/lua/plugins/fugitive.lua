local M = {
  "tpope/vim-fugitive",
}

M.config = function()
  -- Keymaps
  keymap("n", "gs", "<cmd>tabnew<cr><cmd>G<cr><cmd>only<cr>", { silent = true })
  keymap("n", "gj", "<cmd>Gclog<cr>", { silent = true })
end

return M
