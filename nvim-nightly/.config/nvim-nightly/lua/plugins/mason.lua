local M = {
  "williamboman/mason.nvim"
}

M.dependencies = {
  'williamboman/mason-lspconfig.nvim'
}

M.config = function()
  require('mason').setup()
end

return M
