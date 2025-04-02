local bufmap = function(mode, key, cmd, opts)
  opts = opts or {}
  opts.buffer = 0
  vim.keymap.set(mode, key, cmd, opts)
end

-- Disable netrw
bufmap("n", "<leader>d", "<nop>")

-- Disable keymaps used for resizing
bufmap("n", "=", "<nop>")
bufmap("n", "-", "<nop>")
bufmap("n", "_", "<nop>")
bufmap("n", "+", "<nop>")
