return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  -- dependencies = {  { 'antosha417/nvim-lsp-file-operations', config = true }, 'folke/lazydev.nvim' },
  dependencies = {
    -- { 'jay-babu/mason-nvim-dap.nvim', cmd = { 'DapInstall', 'DapUninstall' } },
    { 'antosha417/nvim-lsp-file-operations', config = true },
    -- 'folke/lazydev.nvim',
    -- 'rcarriga/nvim-dap-ui',
    -- 'mfussenegger/nvim-dap',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    -- 'theHamsta/nvim-dap-virtual-text',
    'hrsh7th/cmp-nvim-lsp',
  },
  -- opts = {
  --   diagnostics = {
  --     underline = true,
  --     update_in_insert = false,
  --     virtual_text = {
  --       spacing = 4,
  --       source = 'if_many',
  --       prefix = '●',
  --       -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
  --       -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
  --       -- prefix = "icons",
  --     },
  --     severity_sort = true,
  --     signs = {
  --       text = {
  --         [vim.diagnostic.severity.ERROR] = ' ',
  --         [vim.diagnostic.severity.WARN] = ' ',
  --         [vim.diagnostic.severity.HINT] = '󰌵 ',
  --         [vim.diagnostic.severity.INFO] = ' ',
  --       },
  --     },
  --   },
  --   inlay_hints = {
  --     enabled = true,
  --     exclude = { 'vue' }, -- filetypes for which you don't want to enable inlay hints
  --   },
  --   -- codelens = {
  --   --        enabled = false,
  --   --      },
  --   capabilities = {
  --     workspace = {
  --       fileOperations = {
  --         didRename = true,
  --         willRename = true,
  --       },
  --     },
  --   },
  --   format = {
  --     formatting_options = nil,
  --     timeout_ms = nil,
  --   },
  --   settings = {
  --     Lua = {
  --       workspace = {
  --         checkThirdParty = false,
  --       },
  --  --     codeLens = {
  --  --       enable = true,
  --       },
  --       completion = {
  --         callSnippet = 'Replace',
  --       },
  --       doc = {
  --         privateName = { '^_' },
  --       },
  --       hint = {
  --         enable = true,
  --         setType = false,
  --         paramType = true,
  --         paramName = 'Disable',
  --         semicolon = 'Disable',
  --         arrayIndex = 'Disable',
  --       },
  --     },
  --   },
  -- },

  config = function()
    local lspconfig = require 'lspconfig'

    -- import mason_lspconfig plugin
    local mason_lspconfig = require 'mason-lspconfig'
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = 'Show LSP references'
        keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

        opts.desc = 'Show LSP document ui'
        keymap.set('n', '<leader>do', ':lsp-ui-doc', opts) -- show definition, references

        opts.desc = 'Go to declaration'
        keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = 'Show LSP definitions'
        keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

        opts.desc = 'Show LSP implementations'
        keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

        opts.desc = 'Show LSP type definitions'
        keymap.set('n', '<leader>gp', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

        opts.desc = 'See available code actions'
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = 'Smart rename'
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = 'Show buffer diagnostics'
        keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

        opts.desc = 'Show all diagnostics'
        keymap.set('n', '<leader>ad', '<cmd>Telescope diagnostics<CR>', opts) -- show  diagnostics for file

        opts.desc = 'Show line diagnostics'
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = 'Go to previous diagnostic'
        keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = 'Go to next diagnostic'
        keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = 'Restart LSP'
        keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    -- vim.diagnostic.config({
    --   signs = {
    --     text = {
    --       [vim.diagnostic.severity.ERROR] = '', -- or other icon of your choice here, this is just what my config has:
    --       [vim.diagnostic.severity.WARN] = '',
    --       [vim.diagnostic.severity.INFO] = '',
    --       [vim.diagnostic.severity.HINT] = '󰌵',
    --     },
    --   },
    -- })

    local signs = { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        -- if server_name == 'tsserver' then
        --   server_name = 'ts_ls'
        -- end
        -- server_name = server_name == 'tsserver' and 'ts_ls' or server_name
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,

      ['marksman'] = function()
        -- configure lua server (with special settings)
        lspconfig['marksman'].setup {
          capabilities = capabilities,
        }
      end,

      ['lua_ls'] = function()
        -- configure lua server (with special settings)
        lspconfig['lua_ls'].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { 'vim' },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        }
      end,
    }

    -- vim.api.nvim_create_augroup('LspFormatting', { clear = true })
    -- :lua print(vim.inspect(require'cmp'.get_config().sources))
  end,
}

-- diagnostics = {
--        underline = true,
--        update_in_insert = false,
--        virtual_text = {
--          spacing = 4,
--          source = "if_many",
--          prefix = "●",
--          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
--          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
--          -- prefix = "icons",
--        },
--        severity_sort = true,
--        signs = {
--          text = {
--            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
--            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
--            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
--            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
--          },
--        },
--      },
--
--
-- inlay_hints = {
--         enabled = true,
--         exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
--       },
