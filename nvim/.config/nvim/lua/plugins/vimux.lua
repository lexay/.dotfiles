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

  -- Keymaps
  keymap("n", "<leader>vr", "<cmd>lua run_cur_buf()<cr>")
  keymap("n", "<leader>vl", "<cmd>VimuxRunLastCommand<cr>")
  keymap("n", "<leader>vc", "<cmd>VimuxCloseRunner<cr>")
  keymap("n", "<leader>vi", "<cmd>VimuxInspectRunner<cr>")
  keymap("n", "<leader>vp", "<cmd>VimuxPromptCommand<cr>")
  keymap("n", "<leader>vb", [[<cmd>lua run_cur_buf("bundle exec ruby")<cr>]])
  keymap("n", "<leader>vs", [[<cmd>VimuxRunCommand("rails s")<cr>]])

  -- Settings
  vim.g["VimuxUseNearest"] = 0
end

return M
