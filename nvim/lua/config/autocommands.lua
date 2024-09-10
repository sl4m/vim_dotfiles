-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank({ timeout = 1000 })",
})

-- Leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste", })

-- Create the highlight group for trailing whitespace
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#CC6666" })

-- Highlight trailing whitespace on InsertLeave
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
  end,
})

-- Clear the trailing whitespace highlight when you enter insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.fn.clearmatches()
  end,
})

-- Highlight too-long lines
vim.api.nvim_create_autocmd({"BufRead", "InsertEnter", "InsertLeave"}, {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("LineTooLong", [[\%101v.*]], 2)
  end,
})
vim.api.nvim_set_hl(0, "LineTooLong", { ctermbg = "Black", bg = "#000000" })
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LineTooLong", { ctermbg = "Black", bg = "#000000" })
  end,
})

-- Quickfix window settings
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "*grep*",
  callback = function()
    vim.cmd("cwindow")
  end,
})
