return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  build = ':TSUpdate',
  config = function()
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
          scope_incremental = '<leader>si',
          node_decremental = '<bs>',
        },
      },
      ensure_installed = {
        'markdown',
        'regex',
        'markdown_inline',
        'bash',
        'lua',
        'norg',
      },
    }
  end,
}
