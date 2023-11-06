local M = {
  "windwp/nvim-autopairs",
}

M.event = "InsertEnter"

M.config = function()
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  require("nvim-autopairs").setup({
    map_c_w = true,
  })
end

return M
