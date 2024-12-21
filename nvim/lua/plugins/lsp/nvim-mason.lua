return {
  -- event = "BufReadPre",
  "williamboman/mason.nvim",
  keys = {
    { "<leader>ms", "<cmd>Mason<cr>", desc = "Mason" },
    { "<leader>msi", "<cmd>:MasonToolsInstall<cr>", desc = "Mason install" },
    { "<leader>msc", "<cmd>:MasonToolsClean<cr>", desc = "Mason clean" },
  },
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  build = ":MasonUpdate",

  -- lsp server
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- for debug
    "mfussenegger/nvim-dap",
    { "jay-babu/mason-nvim-dap.nvim", cmd = { "DapInstall", "DapUninstall" } },
  },

  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"
    local mason_nvim_dap = require "mason-nvim-dap"

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      max_concurrent_installers = 10,
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        -- 'jdtls'
        'rust_analyzer',
        "html",
        "emmet_language_server",
        "cssls",
        "tailwindcss",
        "gopls",
        "phpactor",
        "graphql",
        "prismals",
        "pyright",
        "lua_ls",
        "docker_compose_language_service",
        "dockerls",
        "ts_ls",
        "denols",
        "nil_ls",
        -- 'ocamllsp',
        -- "ruff_lsp",
        "bashls",
        "biome",
        "helm_ls",
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        -- rust
        "rustfmt",
        -- 'cargo-edit',
        "bacon",
        "shfmt",
        "oxlint",
        -- 'pint',
        "phpcs",
        "php-cs-fixer",
        "prettier",
        "stylua",
        "isort",
        "black",
        "eslint_d",
        "ruff",
        "flake8",
        -- "hadolint",
        -- 'nixpkgs-fmt',
        -- 'google-java-format',
        -- 'checkstyle',
        "llm-ls",
        -- golang
        -- 'goimports-reviser',
        "goimports",
        "gomodifytags",
        -- 'impl',
        "gofumpt",
        "golangci-lint",
      },
    }

    mason_nvim_dap.setup {
      ensure_installed = {
        "go-debug-adapter",
        "delve",
        "js-debug-adapter",
      },
      automatic_installation = false,
    }
  end,
}
