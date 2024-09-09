local map = vim.keymap.set

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup language servers.
      local lspconfig = require("lspconfig")

      -- Rust
      lspconfig.rust_analyzer.setup {
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            imports = {
              group = {
                enable = false,
              },
            },
            completion = {
              postfix = {
                enable = false,
              },
            },
          },
        },
      }

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      map("n", "<leader>e", vim.diagnostic.open_float)
      map("n", "[d", vim.diagnostic.goto_prev)
      map("n", "]d", vim.diagnostic.goto_next)
      map("n", "<leader>q", vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          map("n", "gD", vim.lsp.buf.declaration, opts)
          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
          map("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          map("n", "<leader>r", vim.lsp.buf.rename, opts)
          map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "<leader>f", function()
            vim.lsp.buf.format { async = true }
          end, opts)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          -- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
          -- *and* there"s some way to make it only apply to the current line.
          -- if client.server_capabilities.inlayHintProvider then
          --     vim.lsp.inlay_hint(ev.buf, true)
          -- end

          -- None of this semantics tokens business.
          -- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
          client.server_capabilities.semanticTokensProvider = nil
        end,
      })
    end
  },
  -- LSP-based code-completion
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require"cmp"
      cmp.setup({
        snippet = {
          -- REQUIRED by nvim-cmp. get rid of it once we can
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Accept currently selected item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "path" },
        }),
        experimental = {
          ghost_text = true,
        },
      })

      -- Enable completing paths in :
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" }
        })
      })
    end
  },
  -- inline function signatures
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      -- Get signatures (and _only_ signatures) when in argument lists.
      require "lsp_signature".setup({
        doc_lines = 0,
        handler_opts = {
          border = "none"
        },
        hint_prefix = "🐏 ",
      })
    end
  },
}
