return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "graphql",
        "prismals",
        "pyright",
        "biome",
        "gopls",
        "harper_ls",
        "terraformls",
        "jsonls"
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "golangci-lint",
        "ruff",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
