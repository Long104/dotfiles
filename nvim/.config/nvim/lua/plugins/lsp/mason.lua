return {
  -- event = "BufReadPre",
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  -- event = 'VeryLazy',
  cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUpdate' },
  -- event = 'BufReadPre',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',

    'williamboman/mason.nvim',
    -- test
    'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
  },

  config = function()
    -- import mason
    local mason = require 'mason'

    -- import mason-lspconfig
    local mason_lspconfig = require 'mason-lspconfig'

    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
      auto_update = true, -- Default: false
      run_on_start = true, -- Default: true
      start_delay = 1000, -- 1 second delay ( Default: 0 )
      debounce_hours = 1, -- at least 1 hour between attempts to install/update
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        -- "jsserver",
        'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'gopls',
        -- "svelte",
        'lua_ls',
        -- "graphql",
        'emmet_ls',
        'prismals',
        'pyright',
        'marksman',
        -- 'jdtls'
      },
    }

    require('mason-nvim-dap').setup {
      ensure_installed = {},
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'pylint', -- python linter
        'markdownlint-cli2',
        'markdown-toc',
        'eslint_d', -- js linter
        'google-java-format',
        'checkstyle',
        'goimports-reviser',
        'gofumpt',
        'golangci-lint',
        'hlint',
        'blue',
      },

      auto_update = true, -- Default: false
      run_on_start = true, -- Default: true
      start_delay = 1000, -- 1 second delay ( Default: 0 )
      debounce_hours = 1, -- at least 1 hour between attempts to install/update
    }
  end,
}
