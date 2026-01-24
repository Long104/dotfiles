return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  --     },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        markdown = { 'prettier', 'markdownlint-cli2' },
        lua = { 'stylua' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, 'M', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
      vim.cmd 'wa'
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
