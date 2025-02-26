local M = {
  "preservim/vimux",
}

M.branch = "master"

M.config = function()
  local function set_ruby()
    local gemfile = io.open("Gemfile", "r")

    if gemfile then
      gemfile.close()
      return "bundle exec ruby"
    end
  end

  local function check_cmd()
    local commands = {
      ruby = set_ruby,
      javascript = "node",
    }

    local filetype = vim.bo.filetype
    local cmd = commands[filetype]

    return cmd() or filetype
  end

  function run_cur_buf(cmd)
    cmd = cmd or check_cmd()
    local bufname = vim.api.nvim_buf_get_name(0)
    vim.fn.VimuxRunCommand(string.format("clear; %s %s", cmd, bufname))
  end

  function open_runner()
    vim.cmd("VimuxOpenRunner")
    vim.cmd([[call feedkeys("\<C-j>")]])
  end

  -- Keymaps
  keymap("n", "<leader>l", "<cmd>VimuxRunLastCommand<cr>")
  keymap("n", "<leader>o", "<cmd>lua open_runner()<cr>")
  keymap("n", "<leader>r", "<cmd>lua run_cur_buf()<cr>")

  -- Settings
  vim.g["VimuxUseNearest"] = 0
end

return M
