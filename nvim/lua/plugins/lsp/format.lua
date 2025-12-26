return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    {
      "M",
      function()
        require("conform").format {
          lsp_fallback = true,
          async = true,
          timeout_ms = 500,
        }
        -- vim.cmd "wa"
      end,
      mode = { "n", "v", "x" },
      desc = "Format Langs",
    },
  },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascriptreact = { "biome" },
        graphql = { "biome" },
        css = { "biome" },
        go = { "goimports", "gofumpt", "gomodifytags" },
        html = { "biome" },
        json = { "biome" },
        yaml = { "prettier" },
        yml = { "prettier" },
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
      --   async = true,
      --   timeout_ms = 500,
      -- },
    }
  end,
}
