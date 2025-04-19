local M = {
  "preservim/vimux",
}

M.branch = "master"

M.config = function()
  -- Keymaps
  local map = vim.keymap.set
  map("n", "<leader>l", "<cmd>VimuxRunLastCommand<cr>")
  map("n", "<leader>o", "<cmd>lua open_runner()<cr>")
  map("n", "<leader>r", "<cmd>lua run_cur_buf()<cr>")

  -- Settings
  vim.g["VimuxUseNearest"] = 0
end

function M.check_cmd()
  local commands = require("plugins.vimux.filetypes").commands

  return commands[vim.bo.filetype]()
end

function M.run_cur_buf(cmd)
  cmd = cmd or M.check_cmd()
  local bufname = vim.api.nvim_buf_get_name(0)
  vim.fn.VimuxRunCommand(string.format("clear; %s %s", cmd, bufname))
end

function M.open_runner()
  vim.cmd("VimuxOpenRunner")
  vim.cmd([[call feedkeys("\<C-j>")]])
end

return M
