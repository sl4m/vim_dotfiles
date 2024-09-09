-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Disable compatibility mode
vim.opt.compatible = false

-- Basic settings
vim.opt.cmdheight = 2
vim.opt.modelines = 0
vim.opt.encoding = "utf-8"
vim.opt.smartindent = false
vim.opt.history = 10000
vim.opt.number = true
vim.opt.background = "dark"
vim.opt.hidden = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.textwidth = 0
vim.opt.mouse = ""
vim.opt.termguicolors = true

-- Tab and indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Performance-related settings
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- UI settings
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.swapfile = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true

-- Statusline settings
vim.opt.laststatus = 2
vim.opt.statusline = "%<\\ %2*[%n%H%M%R%W]%* %-40f%= %1*%y%*%* %10(L(%l/%L)%) %2(C(%v/125)%) %P"

-- Undo settings
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Window width settings
vim.opt.winwidth = 90
vim.opt.winminwidth = 15
