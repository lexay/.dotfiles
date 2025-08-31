-- Custom functions
local M = {}

-- Show RubyDoc documentation
-- on word under cursor
function M.show_ri()
  local cword = vim.fn.expand("<cword>")
  if cword == "" then
    return print("No word under cursor!")
  end
  vim.cmd("tabnew term://ri --no-pager " .. cword)
end

-- with user prompt
function M.find_ri()
  local input = vim.fn.input({ prompt = "Find in RubyDoc: " })
  if input == "" then
    return print("Input is empty!")
  end
  vim.cmd("tabnew term://ri --no-pager " .. input)
end

-- Close other buffers except current one
function M.buff_only()
  local all_buffs = vim.api.nvim_list_bufs()
  local current_buff = vim.api.nvim_get_current_buf()
  local buffs_listed = {}

  for _, i in ipairs(all_buffs) do
    if vim.api.nvim_buf_is_loaded(i) and vim.api.nvim_get_option_value("buflisted", { buf = i }) then
      table.insert(buffs_listed, i)
    end
  end

  local buffs_listed_count = table.getn(buffs_listed)

  if buffs_listed_count == 1 then
    print("Already only buffer")
    return
  end

  for _, i in ipairs(buffs_listed) do
    if i ~= current_buff then
      vim.api.nvim_buf_delete(i, {})
    end
  end

  -- Account for current buffer
  local buffs_deleted_count = buffs_listed_count - 1
  print(buffs_deleted_count, (buffs_deleted_count == 1) and "buffer" or "buffers", "deleted")
end

-- Check if buffer's path is local to CWD
local function is_buffer_local_to_cwd(bufnr, cwd)
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  local separator = cwd:match("[\\/]")

  if cwd == "/" then
    separator = ""
  end

  return bufname:find(cwd .. separator, 1, true) == 1
end

-- Get all buffers local to CWD
local function get_local_buffers()
  local cwd = vim.fn.getcwd()
  local all_buffers = vim.api.nvim_list_bufs()
  local local_buffers = {}

  for _, bufnr in ipairs(all_buffers) do
    if
      vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
      and vim.api.nvim_buf_get_name(bufnr) ~= ""
      and is_buffer_local_to_cwd(bufnr, cwd)
    then
      table.insert(local_buffers, bufnr)
    end
  end

  return local_buffers
end

-- Switch to next local buffer
function M.cycle_next_local_buffer()
  local local_buffers = get_local_buffers()
  local current_bufnr = vim.api.nvim_get_current_buf()

  for i, bufnr in ipairs(local_buffers) do
    if bufnr == current_bufnr then
      local next_bufnr = local_buffers[(i % #local_buffers) + 1]
      vim.api.nvim_set_current_buf(next_bufnr)
      return
    end
  end
end

-- Switch to previous local buffer
function M.cycle_prev_local_buffer()
  local local_buffers = get_local_buffers()
  local current_bufnr = vim.api.nvim_get_current_buf()

  for i, bufnr in ipairs(local_buffers) do
    if bufnr == current_bufnr then
      local prev_bufnr = local_buffers[(i - 2 + #local_buffers) % #local_buffers + 1]
      vim.api.nvim_set_current_buf(prev_bufnr)
      return
    end
  end
end

-- Delete current buffer and go back to previous one
function M.backdelete()
  local current_bufnr = vim.api.nvim_get_current_buf()
  M.cycle_prev_local_buffer()
  vim.cmd("bdelete " .. current_bufnr)
end

-- Resize current window to max size and back
function M.maxresize()
  local winwidth = vim.api.nvim_win_get_width(0)
  local winheight = vim.api.nvim_win_get_height(0)
  local max_windwidth = vim.o.columns
  local max_winheight = vim.o.lines

  if winwidth <= max_windwidth / 2 or winheight <= max_winheight / 2 then
    vim.cmd("resize")
    vim.cmd("vertical resize")
  else
    vim.cmd([[call feedkeys("\<C-w>=")]])
  end
end

-- Clear quickfix list
function M.clear_qf()
  vim.fn.setqflist({}, "r")
end



end
return M
