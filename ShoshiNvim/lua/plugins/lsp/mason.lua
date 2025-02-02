return {
  -- event = "BufReadPre",
  'williamboman/mason.nvim',
  keys = {
    { '<leader>ms', '<cmd>Mason<cr>', desc = 'Mason' },
    { '<leader>msi', '<cmd>:MasonToolsInstall<cr>', desc = 'Mason install' },
    { '<leader>msc', '<cmd>:MasonToolsClean<cr>', desc = 'Mason clean' },
  },
  cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
  build = ':MasonUpdate',
  -- opts_extend = { 'ensure_installed' },
  -- opts = {
  --   ensure_installed = {
  --     'stylua',
  --     'shfmt',
  --     'prettier',
  --     'pint',
  --     'phpcs',
  --     'php-cs-fixer',
  --   },
  -- },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- test
    -- 'mfussenegger/nvim-dap',
    -- { 'jay-babu/mason-nvim-dap.nvim', cmd = { 'DapInstall', 'DapUninstall' } },
  },
  config = function()
    -- import mason
    local mason = require 'mason'
    -- local mason_nvim_dap = require 'mason-nvim-dap'

    -- import mason-lspconfig
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {

      ui = {
        icons = {
          package_pending = ' ',
          package_installed = ' ',
          package_uninstalled = ' ',
        },
      },
      max_concurrent_installers = 10,
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        'marksman',
        'lua_ls',
        'ts_ls',
        'ltex',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'eslint_d',
        'markdownlint-cli2',
        'markdown-toc',
        'stylua',
        'shfmt',
        'prettier',
        'biome',
      },
      -- auto_update = true, -- Default: false
      -- run_on_start = true, -- Default: true
      -- start_delay = 1000, -- 1 second delay ( Default: 0 )
      -- debounce_hours = 1, -- at least 1 hour between attempts to install/update
    }

    -- mason_nvim_dap.setup {
    --   ensure_installed = {},
    --   automatic_installation = false,
    --   -- automatic_installation = true,
    --   handlers = {
    --     function(config)
    --       require('mason-nvim-dap').default_setup(config)
    --     end,
    --   }, -- sets up dap in the predefined manner
    -- }
  end,
}
