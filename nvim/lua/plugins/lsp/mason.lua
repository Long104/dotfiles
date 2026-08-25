return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    init = function()
      -- EMFILE fix (macOS): 14+ LSP servers × recursive didChangeWatchedFiles watchers exhausted the fd limit; Neovim 0.11+ honors this opt-out and falls back to its own change detection.
      vim.lsp.config("*", {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = { dynamicRegistration = false },
          },
        },
      })
    end,
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
