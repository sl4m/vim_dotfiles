local LazyFile = { "BufNewFile", "BufReadPost" }

return {
  { "tpope/vim-fugitive", },
  {
    "ibhagwan/fzf-lua",
    config = function()
      vim.keymap.set("", "<LocalLeader>t", require('fzf-lua').files)
    end
  },
  { "itchyny/lightline.vim", },
  {
    "williamboman/mason.nvim",
    config = function()
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(require("config.daplsp_list"), " "))
      end, {})
      require("mason").setup({ max_concurrent_installers = 10, })
    end,
  },
  {
    "preservim/nerdtree",
    keys = {
      { "<LocalLeader>nt", ":NERDTreeToggle<CR>", noremap = true, silent = true },
      { "<LocalLeader>nr", ":NERDTree<CR>", noremap = true, silent = true },
      { "<LocalLeader>nf", ":NERDTreeFind<CR>", noremap = true, silent = true },
    },
    config = function()
      vim.g.NERDTreeShowHidden = 1
    end
  },
  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = LazyFile,
    opts = {},
  },
}
