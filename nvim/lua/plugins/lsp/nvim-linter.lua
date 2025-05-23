return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "BufReadPre" },
  config = function()
    local lint = require "lint"
    vim.keymap.set("n", "<leader>lintinfo", '<cmd>lua print(vim.inspect(require("lint").linters_by_ft))<CR>', { noremap = true, silent = true })

    local function print_available_linters()
      print "Available linters:"
      for linter, _ in pairs(lint.linters) do
        print(linter)
      end
    end
    vim.keymap.set("n", "<leader>lls", function()
      print_available_linters()
    end, { noremap = true, silent = true, desc = "Print available linters" })

    vim.env.PATH = vim.env.PATH .. ":/etc/profiles/per-user/pantornchuavallee/bin"

    lint.linters_by_ft = {
      -- php = { 'phpcs' },
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      -- python = { "ruff" },
      go = { "golangcilint" },
      Dockerfile = { "hadolint" },
      rust = { "bacon" },
    }

    lint.linters = {

      ---@diagnostic disable-next-line: missing-fields
      bacon = {
        cmd = vim.fn.stdpath "data" .. "/mason/bin/bacon",
        stdin = true,
        args = {}, -- add any necessary arguments if needed
      },
      -- test
      -- python
      ------@diagnostic disable-next-line: missing-fields
      ---flake8 = {
      ---  cmd = vim.fn.stdpath "data" .. "/mason/bin/flake8",
      ---  stdin = false,
      ---  args = {}, -- add any necessary arguments if needed
      ---},
      ---@diagnostic disable-next-line: missing-fields
      ruff = {
        cmd = vim.fn.stdpath "data" .. "/mason/bin/ruff",
        stdin = false,
        args = { "check", vim.api.nvim_buf_get_name(0) }, -- Run check on current file
        stream = "stdout",
        ignore_exitcode = true,
      },
      -- typescript
      ---@diagnostic disable-next-line: missing-fields
      -- oxlint = {
      --   cmd = "/Users/pantornchuavallee/.local/share/nvim/mason/bin/oxlint", -- use the full path
      --   stdin = true,
      --   args = {}, -- add any necessary arguments if needed
      --   -- args = {
      --   --   "--no-warn-ignored", -- <-- this is the key argument
      --   --   "--format",
      --   --   "json",
      --   --   "--stdin",
      --   --   "--stdin-filename",
      --   --   "%f",
      --   --   function()
      --   --     return vim.api.nvim_buf_get_name(0)
      --   --   end,
      --   -- },
      -- },
      ---@diagnostic disable-next-line: missing-fields
      biome = {
        cmd = vim.fn.stdpath "data" .. "/mason/bin/biome",
        stdin = false, -- Disable stdin if oxlint reads files directly
        args = {
          "--no-warn-ignored",
          "--format",
          "json",
          vim.api.nvim_buf_get_name(0), -- Current file path
        },
        stream = "stdout", -- Use stdout only since oxlint doesn't report on stderr
        ignore_exitcode = true, -- Ignore non-zero exit codes
      },

      ---@diagnostic disable-next-line: missing-fields
      -- eslint_d = {
      --   args = {
      --     "--no-warn-ignored", -- <-- this is the key argument
      --     "--format",
      --     "json",
      --     "--stdin",
      --     "--stdin-filename",
      --     "%f",
      --     function()
      --       return vim.api.nvim_buf_get_name(0)
      --     end,
      --   },
      --   cmd = "/Users/pantornchuavallee/.local/share/nvim/mason/bin/eslint_d",
      --   command = "eslint_d",
      -- },

      -- golang
      ---@diagnostic disable-next-line: missing-fields
      golangcilint = {
        cmd = vim.fn.stdpath "data" .. "/mason/bin/golangci-lint",
        stdin = true,
        args = {}, -- add any necessary arguments if needed
      },

      -- docker
      ---@diagnostic disable-next-line: missing-fields
      hadolint = {
        command = "hadolint",
        args = { "--from", "dockerfile" },
        cmd = vim.fn.stdpath "data" .. "/mason/bin/hadolint",
        stdin = true,
      },
    }

    ------@diagnostic disable-next-line: missing-fields
    ---lint.linters.golangcilint = {
    ---  cmd = '/Users/pantorn/.local/share/ZenVim/mason/bin/golangci-lint', -- use the full path
    ---  stdin = true,
    ---  args = {}, -- add any necessary arguments if needed
    ---}

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    -- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'BufReadPost' }, {
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>li", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}

-- return {
--   'mfussenegger/nvim-lint',
--   lazy = true,
--   event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
--   config = function()
--     local lint = require 'lint'
--
-- vim.keymap.set('n', '<leader>lintinfo', '<cmd>lua print(vim.inspect(require("lint").linters_by_ft))<CR>', { noremap = true, silent = true })
--
-- vim.keymap.set(
--   'n',
--   '<leader>lintdebug',
--   '<cmd>lua print("Available linters:")<CR><cmd>lua for linter, _ in pairs(require("lint").linters) do print(linter) end<CR>',
--   { noremap = true, silent = true, desc = 'Print available linters' }
-- )
--
--     lint.linters_by_ft = {
--       javascript = { 'eslint_d' },
--       typescript = { 'eslint_d' },
--       vue = { 'eslint_d' },
--       go = { 'golangcilint' },
--     }
--
--     local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
--
--     vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
--       group = lint_augroup,
--       callback = function()
--         lint.try_lint()
--       end,
--     })
--
--     vim.keymap.set('n', '<leader>li', function()
--       lint.try_lint()
--     end, { desc = 'Trigger linting for current file' })
--   end,
-- }
