return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  -- event = {"VeryLazy"},
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    -- import nvim-treesitter plugin
    require('nvim-treesitter.install').prefer_git = true
    local treesitter = require 'nvim-treesitter.configs'

    -- configure treesitter
    treesitter.setup { -- enable syntax highlighting
      -- sync_install = false,
      -- ignore_install = { '' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      auto_install = true,
      -- enable indentation
      indent = { enable = true, disable = { 'ruby' } },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        'python',
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'prisma',
        'markdown',
        'markdown_inline',
        'svelte',
        'graphql',
        'bash',
        'lua',
        'luadoc',
        'vim',
        'dockerfile',
        'gitignore',
        'query',
        'vimdoc',
        'c',
        'java',
        'go',
        'gomod',
        'gowork',
        'gosum',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    }
  end,
}
