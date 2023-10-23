vim.api.nvim_create_autocmd("BufWritePost",
{
  pattern = (vim.env.HOME .. "/.dotfiles/nvim/.config/nvim/init.lua"),
  command = "source $MYVIMRC"
})
