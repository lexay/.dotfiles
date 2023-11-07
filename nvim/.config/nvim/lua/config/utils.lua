-- Custom functions
local M = {}

-- Find documentation on word under cursor in RubyDoc ri
-- until Telescope extension built / found
M.find_ri = function()
  vim.cmd("tabnew term://ri --no-pager " .. vim.fn.expand("<cword>"))
end

return M
