return {
  'nvim-treesitter/nvim-treesitter',
  -- event = { 'BufEnter' },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
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
        'norg',
        "rust",
        "zig",
        "helm",
        "cpp",
        -- 'java',
        "nix",
        -- "blade",
        "python",
        "json",
        "jsonc",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "prisma",
        "sql",
        "regex",
        "php",
        "php_only",
        "graphql",
        "bash",
        "lua",
        "luadoc",
        "vim",
        "dockerfile",
        "http",
        "gitignore",
        "query",
        "vimdoc",
        "php_only",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "terraform",
        "markdown",
        "markdown_inline",
        "r",
        "rnoweb",
        "yaml",
        "csv",
      },
    }
  end,
}
