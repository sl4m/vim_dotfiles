require("config._lazy")

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

vim.cmd("colorscheme Tomorrow-Night")

require("config.mappings")
require("config.autocommands")
