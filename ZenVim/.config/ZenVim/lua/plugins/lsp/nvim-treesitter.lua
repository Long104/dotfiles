return {
  'nvim-treesitter/nvim-treesitter',
  dependecies = {
    'EmranMR/tree-sitter-blade',
  },
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  build = ':TSUpdate',
  config = function()
    ---@class InstallInfo
    ---@type table<string, ParserInfo>
    ---@type table<string, any>
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs() parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }

    vim.filetype.add {
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    }

    local treesitter = require 'nvim-treesitter.configs'
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      auto_install = true,
      -- enable indentation
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = '<leader>si',
          node_decremental = '<bs>',
        },
      },
      ensure_installed = {
        -- 'properties', --javagrammar
        -- 'rust',
        -- 'c',
        -- 'java',
        'nix',
        'blade',
        'python',
        'json',
        'jsonc',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'prisma',
        'sql',
        'regex',
        'php',
        'php_only',
        'graphql',
        'bash',
        'lua',
        'luadoc',
        'vim',
        'dockerfile',
        'http',
        'gitignore',
        'query',
        'vimdoc',
        'php_only',
        'go',
        'gomod',
        'gowork',
        'gosum',
      },
    }

    vim.keymap.set('n', '<leader>tsi', ':InspectTree<cr>', { desc = 'Inspect the tree' })
  end,
}
