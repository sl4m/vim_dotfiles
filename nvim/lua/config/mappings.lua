local map = vim.keymap.set

-- Search settings
map("n", "/", "/\\v", { noremap = true })
map("v", "/", "/\\v", { noremap = true })
map("n", "<leader><space>", ":noh<CR>:call clearmatches()<CR>", { noremap = true, silent = true })
map("n", "<leader>a", ":Ack<space>", { noremap = true })

-- Trim whitespaces
map("n", "<LocalLeader>ws", ":highlight clear ExtraWhitespace<CR>", { noremap = true, silent = true })

-- Disable arrow keys
map("n", "<up>", "<nop>", { noremap = true })
map("n", "<down>", "<nop>", { noremap = true })
map("n", "<left>", "<nop>", { noremap = true })
map("n", "<right>", "<nop>", { noremap = true })
map("i", "<up>", "<nop>", { noremap = true })
map("i", "<down>", "<nop>", { noremap = true })
map("i", "<left>", "<nop>", { noremap = true })
map("i", "<right>", "<nop>", { noremap = true })
map("v", "<up>", "<nop>", { noremap = true })
map("v", "<down>", "<nop>", { noremap = true })
map("v", "<left>", "<nop>", { noremap = true })
map("v", "<right>", "<nop>", { noremap = true })

-- Navigate within wrapped lines
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })
map("n", "gj", "j", { noremap = true })
map("n", "gk", "k", { noremap = true })

-- Clean trailing whitespace
map("n", "<leader>w", "mz:%s/\\s\\+$//<cr>:let @/=''<cr>`z", { noremap = true })

-- Emacs bindings in command-line mode
map("c", "<C-a>", "<Home>", { noremap = true })
map("c", "<C-e>", "<End>", { noremap = true })
map("c", "<C-p>", "<Up>", { noremap = true })
map("c", "<C-n>", "<Down>", { noremap = true })
map("c", "<C-b>", "<Left>", { noremap = true })
map("c", "<C-f>", "<Right>", { noremap = true })
map("c", "<C-d>", "<Delete>", { noremap = true })
map("c", "<Esc>b", "<S-Left>", { noremap = true })
map("c", "<Esc>f", "<S-Right>", { noremap = true })

-- Keep cursor in place while joining lines
map("n", "J", "mzJ`z", { noremap = true })

-- Split line
map("n", "S", "i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w", { noremap = true })

-- Disable help
map("i", "<F1>", "<ESC>", { noremap = true })
map("n", "<F1>", "<ESC>", { noremap = true })
map("v", "<F1>", "<ESC>", { noremap = true })

-- Convert DOS format to Unix format
map("n", "<leader>ff", ":update<CR>:e ++ff=dos<CR>:setlocal ff=unix<CR>:w<CR>", { noremap = true })
