return {
  "mfussenegger/nvim-lint",
  -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  event = "VeryLazy",
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      python = { "pylint" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      go = { "golangci-lint" },
      Dockerfile = { "hadolint" },
    }

    lint.linters = {
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
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    local function try_linting()
      local linters = lint.linters_by_ft[vim.bo.filetype]

      lint.try_lint(linters)
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        try_linting()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      try_linting()
    end, { desc = "Trigger linting for current file" })
  end,
}
