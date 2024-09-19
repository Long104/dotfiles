-- return {
--   'nvim-treesitter/nvim-treesitter', event = { 'BufReadPre', 'BufNewFile' },
--   -- event = {"VeryLazy"},
--   build = ':TSUpdate',
--   dependencies = {
--     'windwp/nvim-ts-autotag',
--   },
--   config = function()
--     -- import nvim-treesitter plugin
--     require('nvim-treesitter.install').prefer_git = true
--     local treesitter = require 'nvim-treesitter.configs'
--
--     -- configure treesitter
--     treesitter.setup { -- enable syntax highlighting
--       -- sync_install = false,
--       -- ignore_install = { '' },
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { 'ruby' },
--       },
--       auto_install = true,
--       -- enable indentation
--       indent = { enable = true, disable = { 'ruby' } },
--       -- enable autotagging (w/ nvim-ts-autotag plugin)
--       autotag = {
--         enable = true,
--       },
--       -- ensure these language parsers are installed
--       ensure_installed = {
--         'python',
--         'json',
--         'javascript',
--         'typescript',
--         'tsx',
--         'yaml',
--         'html',
--         'css',
--         'prisma',
--         'markdown',
--         'regex',
--         'markdown_inline',
--         'svelte',
--         'graphql',
--         'bash',
--         'lua',
--         'luadoc',
--         'vim',
--         'dockerfile',
--         'gitignore',
--         'query',
--         'vimdoc',
--         'c',
--         'java',
--         'go',
--         'gomod',
--         'gowork',
--         'gosum',
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = '<C-space>',
--           node_incremental = '<C-space>',
--           scope_incremental = false,
--           node_decremental = '<bs>',
--         },
--       },
--     }
--   end,
-- }
--
--

return {
  'nvim-treesitter/nvim-treesitter',
    -- {'EmranMR/tree-sitter-blade',config = function() require('tree-sitter-blade').setup() end },

    'tree-sitter/tree-sitter-php',
    -- opts = function(_, opts)
    --   vim.list_extend(opts.ensure_installed, {
    --     'blade',
    --     'php_only',
    --   })
    -- end,
  -- tag = "v0.9.2",
  event = { 'BufReadPost', 'BufNewFile', 'VeryLazy', 'BufWritePost' },
  cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
  build = ':TSUpdate',

  config = function()
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
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
    -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
    -- diagnostics = { disable = { 'missing-fields' } },
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
      highlight = {
        enable = true,
      },

      auto_install = true,
      -- enable indentation
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          -- scope_incremental = false,
          scope_incremental = '<leader>sn',
          node_decremental = '<bs>',
        },
      },
      ensure_installed = {
        'python',
        'json',
        'jsonc',
        'javascript',
        'typescript',
        'tsx',
        'blade',
        'yaml',
        'html',
        'all',
        'css',
        'prisma',
        'markdown',
        'sql',
        -- 'sxhkdrc',
        -- 'rust',
        'regex',
        'markdown_inline',
        'php',
        'php_only',
        'graphql',
        'bash',
        'lua',
        'properties',
        'luadoc',
        'vim',
        'dockerfile',
        'gitignore',
        'query',
        'vimdoc',
        'c',
        'java',
        'php_only',
        'go',
        'gomod',
        'gowork',
        'gosum',
      },
    }
  end,
}
