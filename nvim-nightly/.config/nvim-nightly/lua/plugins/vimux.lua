local M = {
  'benmills/vimux',
}

M.config = function()
    function check_n_run()
      local intpr
      local filetype = vim.bo.filetype

      if filetype == 'javascript' then
        intpr = 'node'
      elseif filetype == '' then
        intpr = 'cat'
      else
        intpr = filetype
      end

      local bufname = vim.api.nvim_buf_get_name(0)
      local command = string.format('clear; %s %s', intpr, bufname)
      vim.fn.VimuxRunCommand(command)
    end

    -- Keymaps

    keymap('n', '<a-c>', '<cmd>lua check_n_run()<cr>', opts)
    keymap('n', '<a-x>', '<cmd>VimuxCloseRunner<cr>', opts)

    -- Settings
    vim.g["VimuxUseNearest"] = 0
  end

return M
