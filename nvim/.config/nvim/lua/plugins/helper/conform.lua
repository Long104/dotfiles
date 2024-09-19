-- return { -- Autoformat
--   'stevearc/conform.nvim',
--   lazy = false,
--   keys = {
--     {
--       '<leader>f',
--       function()
--         require('conform').format { async = true, lsp_fallback = true }
--       end,
--       mode = '',
--       desc = '[F]ormat buffer',
--     },
--   },
--   opts = {
--     notify_on_error = false,
--     format_on_save = function(bufnr)
--       -- Disable "format_on_save lsp_fallback" for languages that don't
--       -- have a well standardized coding style. You can add additional
--       -- languages here or re-enable it for the disabled ones.
--       local disable_filetypes = { c = true, cpp = true }
--       return {
--         timeout_ms = 500,
--         lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--       }
--     end,
--     formatters_by_ft = {
--       lua = { 'stylua' },
--       -- Conform can also run multiple formatters sequentially
--       -- python = { "isort", "black" },
--       --
--       -- You can use a sub-list to tell conform to run *until* a formatter
--       -- is found.
--       -- javascript = { { "prettierd", "prettier" } },
--     },
--   },
-- }
--
return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        markdown = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        graphql = { 'prettier' },
        liquid = { 'prettier' },
        python = { 'isort', 'black' },
        java = { 'google-java-format' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    --   vim.keymap.set({ "n", "v" }, "<leader>mf", function()
    --     conform.format({
    --       lsp_fallback = true,
    --       async = false,
    --       timeout_ms = 1000,
    --     })
    --   end, { desc = "Format file or range (in visual mode)" })
  end,
}
