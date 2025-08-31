local M = {
  "preservim/vimux",
}

M.branch = "master"

M.config = function()
  -- Use the nearest pane for the vimux runner
  vim.g["VimuxUseNearest"] = 0
end

-- Check file type agains runner commands
local function vimux_check_cmd()
  local commands = require("plugins.vimux.filetypes").commands

  return commands[vim.bo.filetype]()
end

function M.run_cur_buf(cmd)
  cmd = cmd or vimux_check_cmd()
  local bufname = vim.api.nvim_buf_get_name(0)
  vim.fn.VimuxRunCommand(string.format("clear; %s %s", cmd, bufname))
end

function M.open_runner()
  vim.cmd("VimuxOpenRunner")
  vim.cmd([[call feedkeys("\<C-j>")]])
end
return M
