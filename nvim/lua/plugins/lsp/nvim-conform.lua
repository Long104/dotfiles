return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
        -- php = { "prettier" },
        blade = { "blade-formatter", "prettier" },
        -- javascript = { "prettier" },
        -- typescript = { "prettier" },
        -- javascriptreact = { "prettier" },
        -- typescriptreact = { "prettier" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        css = { "prettier" },
        go = { "goimports", "gofumpt", "gomodifytags" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        yml = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        nix = { "alejandra" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        rust = { "rustfmt" },
      },
      -- on save
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    }

    -- vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
    vim.keymap.set({ "n", "v" }, "M", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
