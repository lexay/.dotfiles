local M = {
  -- "lexay/telescope-zoxide.nvim",
  dir = "~/Projects/telescope-zoxide/",
}

M.config = function()
  require("telescope").load_extension("zoxide")

  local map = vim.keymap.set
  map("n", "<leader>zi", "<cmd>Telescope zoxide<cr>")
  map("n", "<leader>za", M.za)
  map("n", "<leader>zr", M.zr)
  map("n", "<leader>ze", "<cmd>tabnew term://zoxide edit<cr><insert>")
end

-- Add to zoxide list
function M.za()
  local cur_buf_dir = vim.fn.expand("%:p:h")
  vim.cmd([[silent! !zoxide add ]] .. cur_buf_dir)
  print(cur_buf_dir .. " added to zoxide!")
end

-- Remove from zoxide list
function M.zr()
  local cur_buf_dir = vim.fn.expand("%:p:h")
  vim.cmd([[silent! !zoxide remove ]] .. cur_buf_dir)
  print(cur_buf_dir .. " removed from zoxide!")
end

return M
