-- Hide banner
vim.g.netrw_banner = 0

-- Copy files recursivelly
vim.g.netrw_localcopycmdopt = " -R"

-- Use `echoerr` for showing errors
vim.g.netrw_use_errorwindow = 0

local bufmap = function(mode, key, cmd, opts)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, opts or {})
end

-- Better navigation keymaps
-- Unset default keymaps
bufmap("n", "a", "<nop>")
bufmap("n", "-", "<nop>")
bufmap("n", "%", "<nop>")
bufmap("n", "cb", "<nop>")
bufmap("n", "cB", "<nop>")
bufmap("n", "cd", "<nop>")
bufmap("n", "C", "<nop>")
bufmap("n", "<c-r>", "<nop>")
bufmap("n", "d", "<nop>")
bufmap("n", "gb", "<nop>")
bufmap("n", "gd", "<nop>")
bufmap("n", "gf", "<nop>")
bufmap("n", "gh", "<nop>")
bufmap("n", "gn", "<nop>")
bufmap("n", "gp", "<nop>")
bufmap("n", "I", "<nop>")
bufmap("n", "i", "<nop>")
bufmap("n", "ma", "<nop>")
bufmap("n", "mA", "<nop>")
bufmap("n", "mb", "<nop>")
bufmap("n", "mB", "<nop>")
bufmap("n", "mc", "<nop>")
bufmap("n", "md", "<nop>")
bufmap("n", "me", "<nop>")
bufmap("n", "mf", "<nop>")
bufmap("n", "mF", "<nop>")
bufmap("n", "mg", "<nop>")
bufmap("n", "mh", "<nop>")
bufmap("n", "mm", "<nop>")
bufmap("n", "mr", "<nop>")
bufmap("n", "ms", "<nop>")
bufmap("n", "mT", "<nop>")
bufmap("n", "mt", "<nop>")
bufmap("n", "mu", "<nop>")
bufmap("n", "mv", "<nop>")
bufmap("n", "mx", "<nop>")
bufmap("n", "mX", "<nop>")
bufmap("n", "mz", "<nop>")
bufmap("n", "O", "<nop>")
bufmap("n", "o", "<nop>")
bufmap("n", "p", "<nop>")
bufmap("n", "P", "<nop>")
bufmap("n", "qb", "<nop>")
bufmap("n", "qf", "<nop>")
bufmap("n", "qF", "<nop>")
bufmap("n", "qL", "<nop>")
bufmap("n", "s", "<nop>")
bufmap("n", "S", "<nop>")
bufmap("n", "Tb", "<nop>")
bufmap("n", "t", "<nop>")
bufmap("n", "Th", "<nop>")
bufmap("n", "u", "<nop>")
bufmap("n", "U", "<nop>")
bufmap("n", "v", "<nop>")
bufmap("n", "x", "<nop>")
bufmap("n", "X", "<nop>")
bufmap("n", "<del>", "<nop>")
bufmap("n", "D", "<nop>")
bufmap("n", "R", "<nop>")

-- Make file
bufmap("n", "F", "<cmd>NetrwKeepj call s:NetrwOpenFile(1)<cr>")
-- Make directory
bufmap("n", "D", [[<cmd>NetrwKeepj call s:NetrwMakeDir("")<cr>]])
-- Remove file(s) /directory(ies) recursivelly
bufmap("n", "R", [[<cmd>NetrwKeepj call s:NetrwLocalRm(b:netrw_curdir)<cr>]])
-- Move
-- Back to previous directory
bufmap("n", "H", [[<cmd>NetrwKeepj call s:NetrwBookHistHandler(4, expand("%"))<cr>]])
-- Back to parent directory
bufmap("n", "h", "<cmd>NetrwKeepj call s:NetrwBrowseUpDir(1)<cr>")
-- Forward to sub directory / Open file
bufmap("n", "l", "<cr>")
-- Hide/show dotfiles files
bufmap("n", ".", "<cmd>NetrwKeepj call s:NetrwHidden(1)<cr>")
-- Close netrw and return to the previous buffer
bufmap("n", "<escape>", "<cmd>Rexplore<cr>")
-- Open file in new split
bufmap("n", "<C-x>", "<cmd>NetrwKeepj call s:NetrwSplit(3)<cr>")
-- Open file in new tab
bufmap("n", "<C-n>", "<cmd>NetrwKeepj call s:NetrwSplit(4)<cr>")
-- Open file in new vsplit
bufmap("n", "<C-v>", "<cmd>NetrwKeepj call s:NetrwSplit(5)<cr>")
-- Get diff for files
bufmap("n", "<C-d>", "<cmd>NetrwKeepj call s:NetrwMarkFileDiff(1)<cr>")

-- Better marks
-- Mark/unmark file(s)
bufmap("n", "<tab>", "<cmd>NetrwKeepj call s:NetrwMarkFile(1, s:NetrwGetWord())<cr>")
-- Unmark marked files from current netrw buffer
bufmap("n", "<s-tab>", [[<cmd>NetrwKeepj call s:NetrwUnmarkList(bufnr("%"), b:netrw_curdir)<cr>]])
-- Unmark all marked files
bufmap("n", "<leader><tab>", "<cmd>NetrwKeepj call s:NetrwUnMarkFile(1)<cr>")
-- List marked files
bufmap("n", "s", [[<cmd>echo join(netrw#Expose("netrwmarkfilelist"), "\n")<cr>]])
-- Place target on directory for consecutive copy/move command and show that directory name as target
bufmap(
  "n",
  "t",
  [[<cmd>NetrwKeepj call s:NetrwMarkFileTgt(1)<cr><cmd>echo 'Target: ' . netrw#Expose("netrwmftgt")<cr>]]
)
-- Copy marked files
bufmap("n", "C", "<cmd>NetrwKeepj call s:NetrwMarkFileCopy(1)<cr>")
-- Move marked files and refresh current netrw buffer
bufmap(
  "n",
  "X",
  [[<cmd>NetrwKeepj call s:NetrwMarkFileMove(1)<cr><cmd>NetrwKeepj call s:NetrwRefresh(1, b:netrw_curdir)<cr>]]
)
-- Set quickfix list with marked files
bufmap("n", "Q", "<cmd>lua NetrwSetQFWithMarked()<cr>")
function NetrwSetQFWithMarked()
  local marked = vim.fn.eval([[netrw#Expose("netrwmarkfilelist")]])

  if marked == "n/a" then
    return vim.api.nvim_err_writeln("No files or directories marked!")
  end

  local qf = {}

  for _, file in ipairs(marked) do
    table.insert(qf, { filename = file })
  end

  vim.fn.setqflist(qf, "r")
end
-- Send marked file(s) to buffer list without loading them and edit first one from marked list
bufmap("n", "B", "<cmd>NetrwKeepj call s:NetrwMarkFileEdit(1)<cr>")

-- Rename file / directory
bufmap("n", "N", "<cmd>NetrwKeepj call s:NetrwLocalRename(b:netrw_curdir)<cr>")

-- Highlight marked files
vim.cmd([[hi! link netrwMarkFile Search]])

-- Refresh tree
bufmap("n", "r", "<plug>NetrwRefresh")
