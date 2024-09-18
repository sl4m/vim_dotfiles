vim.cmd("colorscheme Tomorrow-Night")

local red_colour = "#cc6666"
vim.cmd(string.format("highlight DiagnosticError guifg=%s", red_colour))
vim.cmd(string.format("highlight ErrorMsg guibg=%s", red_colour))
