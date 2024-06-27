return {

  {
    -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {} lint.linters_by_ft['markdown'] = { 'markdownlint' }
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
--
-- return {
--   "mfussenegger/nvim-lint",
--   event = { "BufReadPre", "BufNewFile" },
--   opts = {
-- -- linters = {
-- --       eslint_d = {
-- --         args = {
--     --
-- --           '--no-warn-ignored', -- <-- this is the key argument '--format',
-- --           'json',
-- --           '--stdin', '--stdin-filename', function()
-- --             return vim.api.nvim_buf_get_name(0)
-- --           end,
-- --         },
-- --       },
-- --     },
--    },
--   config = function()
--     local lint = require("lint")
--
--
--     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--
--     -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--     vim.api.nvim_create_autocmd({  "BufWritePost" }, {
--       group = lint_augroup,
--       callback = function()
--         lint.try_lint()
--       end,
--     })
--
--     vim.keymap.set("n", "<leader>l", function()
--       lint.try_lint()
--     end, { desc = "Trigger linting for current file" })
--
-- lint.linters_by_ft = {
--     typescript = { "biomejs", "eslint_d", "eslint" },
--     javascript = { "biomejs", "eslint_d", "eslint" },
--     typescriptreact = { "biomejs", "eslint_d", "eslint" },
--     javascriptreact = { "biomejs", "eslint_d", "eslint" },
--     -- java = { "checkstyle" },
-- }
--
--
-- -- lint.linters_by_ft = {
-- --     typescript = {  "eslint_d", "eslint" },
-- --     javascript = {  "eslint_d", "eslint" },
-- --     typescriptreact = { "eslint_d", "eslint" },
-- --     javascriptreact = {  "eslint_d", "eslint" },
-- --     java = { "checkstyle" },
-- -- }
--
-- local eslint = lint.linters.eslint_d
--
-- eslint.args = {
--     "--no-warn-ignored", -- <-- this is the key argument
--     "--format",
--     "json",
--     "--stdin",
--     "--stdin-filename",
--     function()
--         return vim.api.nvim_buf_get_name(0)
--     end,
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     group = lint_augroup,
--     callback = function()
--         lint.try_lint()
--     end,
-- })
--
--
--
--
--
--
--
--
--   end,
-- }
--
