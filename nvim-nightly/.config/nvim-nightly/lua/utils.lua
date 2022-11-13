function keymap(mode, lsk, rsk, opts)
  local opts = opts or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lsk, rsk, opts)
end

function declare_filetype(extension, filetype)
  local command = string.format('autocmd BufRead,BufNewFile %s setfiletype %s', extension, filetype)
  vim.cmd(command)
end
