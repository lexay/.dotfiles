-- Create no undofile for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.env" },
  command = "lua vim.bo.undofile = false",
})
-- Drop in insert mode immideatelly when in cmd/search window
vim.api.nvim_create_autocmd("CmdwinEnter", {
  command = "startinsert",
})
-- Close cmd/search windo with <escape> like all auxiliary windows
vim.api.nvim_create_autocmd("CmdwinEnter", {
  command = [[lua vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})]],
})
-- Close floating windows with <escape> like all auxiliary windows
vim.api.nvim_create_autocmd("WinEnter", {
  command = [[
  lua
  if vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative == "win" then
    vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})
  end
  ]],
})
-- Disable cmp for <cmd> in command line window
vim.api.nvim_create_autocmd("CmdwinEnter", {
  command = [[lua require('cmp').setup({ enabled = false })]],
})
vim.api.nvim_create_autocmd("CmdwinLeave", {
  command = [[lua require('cmp').setup({ enabled = true })]],
})
-- Close terminal with <escape> like all auxiliary windows
vim.api.nvim_create_autocmd("TermOpen", {
  command = [[lua vim.api.nvim_buf_set_keymap(0, "n", "<escape>", "<cmd>close<cr>", {})]],
})
-- Switch from terminal to normal mode
vim.api.nvim_create_autocmd("TermEnter", {
  command = [[lua vim.api.nvim_buf_set_keymap(0, "t", "<escape>", "<c-bslash><c-n>", {})]],
})
-- Autoresize windows on neovim's size change
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})
-- A short hack to follow and keep working directory for every buffer with g:netrw_keepdir=0
-- except exclusions
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    local name = vim.api.nvim_buf_get_name(0)
    local ft = vim.bo.filetype
    local exclusions = { "fugitive", "term", "netrw", "Command Line", "git" }

    for _, i in ipairs(exclusions) do
      if name:match(i) or ft:match(i) then
        return
      end
    end

    return vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
  end,
})
