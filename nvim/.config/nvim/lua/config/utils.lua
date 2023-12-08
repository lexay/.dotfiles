-- Custom functions
local M = {}

-- Show documentation on word under cursor in RubyDoc ri in a new tab
-- until Telescope extension built / found
function M.show_ri()
  local cword = vim.fn.expand("<cword>")
  if cword == "" then
    return print("No word under cursor!")
  end
  vim.cmd("tabnew term://ri --no-pager " .. cword)
end

function M.find_ri()
  local input = vim.fn.input({ prompt = "Find in RubyDoc: " })
  if input == "" then
    return print("Input is empty!")
  end
  vim.cmd("tabnew term://ri --no-pager " .. input)
end

function M.buff_only()
  local all_buffs = vim.api.nvim_list_bufs()
  local current_buff = vim.api.nvim_get_current_buf()
  local buffs_listed = {}

  for _, i in ipairs(all_buffs) do
    if vim.api.nvim_buf_is_loaded(i) and vim.api.nvim_buf_get_option(i, "buflisted") then
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

function M.za()
  local work_dir = vim.fn.expand("%:p:h")
  vim.cmd([[!zoxide add]] .. " " .. work_dir)
end

function M.zr()
  local work_dir = vim.fn.expand("%:p:h")
  vim.cmd([[!zoxide remove]] .. " " .. work_dir)
end

function M.cd_project_root()
  local buf_dir = vim.fn.expand("%:p:h")
  local dir_list = _G.zoxide_list()
  local project_root

  if dir_list then
    local dir_list_sorted = table.move(dir_list, 1, #dir_list, 1, {})
    table.sort(dir_list_sorted, function(a, b)
      return #a < #b
    end)

    for _, i in ipairs(dir_list_sorted) do
      if string.match(buf_dir:lower(), string.gsub(i:lower(), "-", "%%-")) then
        project_root = i
      end
    end
  else
    project_root = buf_dir
  end
  print(project_root)
  return project_root
end

function M.find_files()
  local project_root = M.cd_project_root()
  require("telescope.builtin").find_files({ cwd = project_root })
end

function M.live_grep()
  local project_root = M.cd_project_root()
  require("telescope.builtin").live_grep({ cwd = project_root })
end
return M
