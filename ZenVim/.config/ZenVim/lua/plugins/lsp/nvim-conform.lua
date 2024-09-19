return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        php = { 'pint', 'php_cs_fixer', 'blade-formatter' },
        blade = { 'blade-formatter', 'prettier' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        go = { 'goimports', 'gofumpt', 'gomodifytags' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    }

    -- vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
    vim.keymap.set({ 'n', 'v' },  'm', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
