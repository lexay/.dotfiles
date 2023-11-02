local M = {
  "preservim/vimux",
}

M.branch = "master"

M.config = function()
  local check_intpr = function()
    local intpr
    local filetype = vim.bo.filetype
    if filetype == "javascript" then
      intpr = "node"
    elseif filetype == "" then
      intpr = "cat"
    else
      intpr = filetype
    end
    return intpr
  end

  function vimux_run(intpr)
    intpr = intpr or check_intpr()
    local bufname = vim.api.nvim_buf_get_name(0)
    local command = string.format("clear; %s %s", intpr, bufname)
    vim.fn.VimuxRunCommand(command)
  end

  -- Keymaps
  keymap("n", "<a-c>", "<cmd>lua vimux_run()<cr>")
  keymap("n", "<a-b>", [[<cmd>lua vimux_run("bundle exec ruby")<cr>]])
  keymap("n", "<a-x>", "<cmd>VimuxCloseRunner<cr>")
  keymap("n", "<a-o>", "<cmd>VimuxRunLastCommand<cr>")

  -- Settings
  vim.g["VimuxUseNearest"] = 0
end

return M
