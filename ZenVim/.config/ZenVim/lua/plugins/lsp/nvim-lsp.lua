return {
  'neovim/nvim-lspconfig',
  -- for showing reference
  --
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  dependencies = {
    -- file
    { 'antosha417/nvim-lsp-file-operations', config = true },
    -- 'jubnzv/virtual-types.nvim',

    -- debug
    -- { 'jay-babu/mason-nvim-dap.nvim', cmd = { 'DapInstall', 'DapUninstall' } },
    -- 'rcarriga/nvim-dap-ui',
    -- 'mfussenegger/nvim-dap',
    -- 'theHamsta/nvim-dap-virtual-text',

    -- mason
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()
    -- require('lspconfig').ocamllsp.setup{
    --   on_attach = require'virtualtypes'.on_attach
    -- }

    local lspconfig = require 'lspconfig'

    -- import mason_lspconfig plugin
    local mason_lspconfig = require 'mason-lspconfig'
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev) -- Buffer local mappings.
        local opts = { buffer = ev.buf, silent = true }

        -- keymap.set('n', '<leader>gv', function()
        --   require('lspconfig').ocamllsp.setup { on_attach = require('virtualtypes').on_attach }
        -- end, opts) -- lsp references

        opts.desc = 'Show LSP references'
        keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', opts) -- lsp references

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
        keymap.set('n', 'D', vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = 'Go to previous diagnostic'
        keymap.set('n', '<leader>[p', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = 'Go to next diagnostic'
        keymap.set('n', '<leader>]d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', 'T', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = 'Restart LSP'
        keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- local on_attach = function(client, bufnr)
    --   --- Only Neovim 0.7
    --   if client.resolved_capabilities.code_lens then
    --     local codelens = vim.api.nvim_create_augroup(
    --       'LSPCodeLens',
    --       { clear = true }
    --     )
    --     vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    --       group = codelens,
    --       callback = function()
    --         vim.lsp.codelens.refresh()
    --       end,
    --       buffer = bufnr,
    --       once = true,
    --     })
    --     vim.api.nvim_create_autocmd({ 'BufWritePost', 'CursorHold' }, {
    --       group = codelens,
    --       callback = function()
    --         vim.lsp.codelens.refresh()
    --       end,
    --       buffer = bufnr,
    --     })
    --   end
    -- end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        -- if server_name == 'tsserver' then
        --   server_name = 'ts_ls'
        -- end
        -- server_name = server_name == 'tsserver' and 'ts_ls' or server_name
        lspconfig[server_name].setup {
          capabilities = capabilities,
          -- on_attach = on_attach,
        }
      end,

      ['tailwindcss'] = function()
        lspconfig['tailwindcss'].setup {
          -- cmd = { "bunx", "tailwindcss-language-server", "--stdio" },
          capabilities = capabilities,
          completions = {
            completeFunctionCalls = true,
          },
          filetypes = { 'php', 'html', 'typescriptreact', 'javascriptreact', 'blade', 'markdown' },
        }
      end,

      ['graphql'] = function()
        -- configure graphql language server
        lspconfig['graphql'].setup {
          capabilities = capabilities,
          filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
        }
      end,

      ['emmet_ls'] = function()
        -- configure emmet language server
        lspconfig['emmet_ls'].setup {
          capabilities = capabilities,
          filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
        }
      end,

      ['nil_ls'] = function()
        -- configure emmet language server
        lspconfig['nil_ls'].setup {
          capabilities = capabilities,
          settings = {
            nil_ls = {
              formatter = {
                command = 'nixpkgs-fmt',
              },
            },
          },
        }
      end,

      ['docker_compose_language_service'] = function()
        -- configure emmet language server
        local function set_filetype(pattern, filetype)
          vim.api.nvim_create_autocmd({ 'BufEnter', 'BufReadPost', 'BufRead', 'BufNewFile' }, {
            pattern = pattern,
            command = 'set filetype=' .. filetype,
          })
        end

        set_filetype({ 'docker-compose.yml', 'docker-compose.yaml' }, 'yaml.docker-compose')

        lspconfig['docker_compose_language_service'].setup {
          capabilities = capabilities,
          filetypes = { 'yaml.docker-compose' },
          -- filetypes = { 'yml', 'yaml' },
        }
      end,

      -- ['rust_analyzer'] = function()
      --   --     require("rust-tools").setup {}
      --   require('lspconfig').rust_analyzer.setup {
      --     settings = {
      --       ['rust-analyzer'] = {
      --         inlayHints = {
      --           chainingHints = true,
      --           typeHints = true,
      --           parameterHints = true,
      --           maxLength = 25,
      --           enumVariant = true,
      --           -- parameterHints = {
      --           --   mode = "PlainText",
      --           -- },
      --         },
      --       },
      --     },
      --   }
      -- end,

      ['ts_ls'] = function()
        require('lspconfig').ts_ls.setup {
          cmd = { 'typescript-language-server', '--stdio' },
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },

          filetypes = { 'typescriptreact', 'javascriptreact', 'typescript', 'javascript' },
        }
      end,

      ['gopls'] = function()
        require('lspconfig').gopls.setup {
          settings = {
            gopls = {
              hints = {
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
              },
            },
          },
          filetypes = { 'go' },
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

    local function clear_lsp_group()
      vim.diagnostic.reset()
      vim.lsp.buf.clear_references()
    end

    vim.keymap.set('n', '<leader>cl', clear_lsp_group, { desc = 'Clear LSP group', silent = true })
  end,
}
