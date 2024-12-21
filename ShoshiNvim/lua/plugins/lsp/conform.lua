return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  --     opts = {
  --       formatters_by_ft = {
  --         lua = { "stylua" },
  --       },
  -- format_on_save = {
  --     -- These options will be passed to conform.format()
  --     timeout_ms = 500,
  --     lsp_format = "fallback",
  --   },
  --
  --     },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        markdown = { 'prettier', 'markdown-toc', 'markdownlint-cli2' },
        lua = { 'stylua' },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    }

    vim.keymap.set({ 'n', 'v' }, 'M', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
