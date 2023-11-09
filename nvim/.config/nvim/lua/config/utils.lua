-- Custom functions
local M = {}

-- Show documentation on word under cursor in RubyDoc ri in a new tab
-- until Telescope extension built / found
M.show_ri = function()
  local cword = vim.fn.expand("<cword>")
  if cword == "" then
    return print("No word under cursor!")
  end
  vim.cmd("tabnew term://ri --no-pager " .. cword)
end

M.find_ri = function()
  local input = vim.fn.input({ prompt = "Find in RubyDoc: " })
  if input == "" then
    return print("Input is empty!")
  end
  vim.cmd("tabnew term://ri --no-pager " .. input)
end

return M
