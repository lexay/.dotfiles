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

M.buff_only = function()
  local all_buffs = vim.api.nvim_list_bufs()
  local current_buff = vim.api.nvim_get_current_buf()
  local buffs_count = table.getn(all_buffs)

  if buffs_count == 1 then
    print("Already only buffer")
    return
  end

  for _, i in ipairs(all_buffs) do
    if i ~= current_buff then
      vim.api.nvim_buf_delete(i, {})
    end
  end
  print(buffs_count - 1 .. " " .. "buffers deleted")
end

return M
