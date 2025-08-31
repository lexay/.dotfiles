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
  local bufs = vim.fn.getbufinfo({ buflisted = true, bufloaded = true })
  local cur_bufnr = vim.api.nvim_get_current_buf()

  if #bufs == 1 then
    print("Already only buffer!")
    return
  end

  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= cur_bufnr then
      vim.api.nvim_buf_delete(buf.bufnr, {})
    end
  end

  -- Account for current buffer
  local bufs_del_count = #bufs - 1
  print(bufs_del_count, (bufs_del_count == 1) and "buffer" or "buffers", "deleted")
end

-- Check if buffer's path is local to CWD
function M.is_buf_local_to_cwd(bufnr, cwd)
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  local separator = cwd:match("[\\/]")

  if cwd == "/" then
    separator = ""
  end

  return bufname:find(cwd .. separator, 1, true) == 1
end

-- Get all buffers local to CWD
function M.get_local_bufs()
  local cwd = vim.fn.getcwd()
  local bufs = vim.fn.getbufinfo({ buflisted = true })
  local local_bufs = {}

  for _, buf in ipairs(bufs) do
    if buf.name ~= "" and M.is_buf_local_to_cwd(buf.bufnr, cwd) then
      table.insert(local_bufs, buf.bufnr)
    end
  end

  return local_bufs
end

-- Switch to next local buffer
function M.cycle_next_local_buf()
  local local_bufs = M.get_local_bufs()
  local current_bufnr = vim.api.nvim_get_current_buf()

  for i, bufnr in ipairs(local_bufs) do
    if bufnr == current_bufnr then
      local next_bufnr = local_bufs[(i % #local_bufs) + 1]
      vim.api.nvim_set_current_buf(next_bufnr)
      return
    end
  end
end

-- Switch to previous local buffer
function M.cycle_prev_local_buf()
  local local_bufs = M.get_local_bufs()
  local current_bufnr = vim.api.nvim_get_current_buf()

  for i, bufnr in ipairs(local_bufs) do
    if bufnr == current_bufnr then
      local prev_bufnr = local_bufs[(i - 2 + #local_bufs) % #local_bufs + 1]
      vim.api.nvim_set_current_buf(prev_bufnr)
      return
    end
  end
end

-- Unlist current buffer and go back to previous one
function M.backunlist()
  local current_bufnr = vim.api.nvim_get_current_buf()
  M.cycle_prev_local_buf()
  vim.api.nvim_set_option_value("buflisted", false, { buf = current_bufnr })
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
