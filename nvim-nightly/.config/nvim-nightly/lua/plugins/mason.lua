local M = {
  "williamboman/mason.nvim"
}

M.dependencies = {
  'williamboman/mason-lspconfig.nvim'
}

M.config = function()
  require('mason').setup({
      install_root_dir = os.getenv('HOME') .. "/.local/share/nvim-nightly/data/mason",
    })
end

return M
