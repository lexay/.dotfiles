local M = {
  "tpope/vim-fugitive",
}

M.config = function()
  -- Keymaps
  local map = vim.keymap.set
  map("n", "gs", "<cmd>tabnew<cr><cmd>G<cr><cmd>only<cr>", { silent = true })
  map("n", "gj", "<cmd>Gclog<cr>", { silent = true })
  map("n", "gA", "<cmd>Git add %<cr>", { silent = true })
end

return M
