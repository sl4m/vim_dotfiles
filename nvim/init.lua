require("config._lazy")

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

require("config.colorscheme")
require("config.mappings")
require("config.autocommands")
