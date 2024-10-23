local M = {
  "preservim/vimux",
}

M.branch = "master"

M.config = function()
  local check_cmd = function()
    local filetype = vim.bo.filetype

    if filetype == "" then
      return "cat"
    end

    local commands = {
      javascript = "node",
    }

    return commands[filetype] or filetype
  end

  function run_cur_buf(cmd)
    cmd = cmd or check_cmd()
    local bufname = vim.api.nvim_buf_get_name(0)
    vim.fn.VimuxRunCommand(string.format(" clear; %s %s", cmd, bufname))
  end

  function open_runner()
    vim.cmd("VimuxOpenRunner")
    vim.cmd([[call feedkeys("\<C-j>")]])
  end

  -- Keymaps
  keymap("n", "<leader>ee", "<cmd>lua run_cur_buf()<cr>")
  keymap("n", "<leader>el", "<cmd>VimuxRunLastCommand<cr>")
  keymap("n", "<leader>ei", "<cmd>VimuxInspectRunner<cr>")
  keymap("n", "<leader>eo", "<cmd>lua open_runner()<cr>")
  keymap("n", "<leader>ex", "<cmd>VimuxCloseRunner<cr>")
  keymap("n", "<leader>ep", "<cmd>VimuxPromptCommand<cr>")
  keymap("n", "<leader>eeb", [[<cmd>lua run_cur_buf("bundle exec ruby")<cr>]])
  keymap("n", "<leader>ees", [[<cmd>VimuxRunCommand("rails s")<cr>]])

  -- Settings
  vim.g["VimuxUseNearest"] = 0
end

return M
