return {
  "neovim/nvim-lspconfig",
  -- for showing reference
  --
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    -- file
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- 'jubnzv/virtual-types.nvim',

    -- debug
    -- { 'jay-babu/mason-nvim-dap.nvim', cmd = { 'DapInstall', 'DapUninstall' } },
    -- 'rcarriga/nvim-dap-ui',
    -- 'mfussenegger/nvim-dap',
    -- 'theHamsta/nvim-dap-virtual-text',

    -- mason
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    -- require('lspconfig').ocamllsp.setup{
    --   on_attach = require'virtualtypes'.on_attach
    -- }
    local util = require "lspconfig.util"
    local lspconfig = require "lspconfig"

    -- import mason_lspconfig plugin
    local mason_lspconfig = require "mason-lspconfig"
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev) -- Buffer local mappings.
        local opts = { buffer = ev.buf, silent = true }

        -- keymap.set('n', '<leader>gv', function()
        --   require('lspconfig').ocamllsp.setup { on_attach = require('virtualtypes').on_attach }
        -- end, opts) -- lsp references

        opts.desc = "Show LSP references"
        keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- lsp references

        opts.desc = "Go to declaration"
        keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        -- opts.desc = "Show LSP definitions"
        -- keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gp", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show all diagnostics"
        keymap.set("n", "<leader>ad", "<cmd>Telescope diagnostics<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "D", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "<leader>[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "<leader>]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "T", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config {
      update_in_insert = true,
      -- signs = {
      --   text = {
      --     [vim.diagnostic.severity.ERROR] = '', -- or other icon of your choice here, this is just what my config has:
      --     [vim.diagnostic.severity.WARN] = '',
      --     [vim.diagnostic.severity.INFO] = '',
      --     [vim.diagnostic.severity.HINT] = '󰌵',
      --   },
      -- },
    }

    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- local on_attach = function(client, bufnr)
    --   --- Only Neovim 0.7
    --   if client.resolved_capabilities.code_lens then
    --     local codelens = vim.api.nvim_create_augroup(
    --       'LSPCodeLens',
    --       { clear = true }
    --     )
    --     vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    --       group = codelens,
    --       callback = function()
    --         vim.lsp.codelens.refresh()
    --       end,
    --       buffer = bufnr,
    --       once = true,
    --     })
    --     vim.api.nvim_create_autocmd({ 'BufWritePost', 'CursorHold' }, {
    --       group = codelens,
    --       callback = function()
    --         vim.lsp.codelens.refresh()
    --       end,
    --       buffer = bufnr,
    --     })
    --   end
    -- end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        if server_name == "ts_ls" then
          return
        end
        -- server_name = server_name == 'tsserver' and 'ts_ls' or server_name
        lspconfig[server_name].setup {
          capabilities = capabilities,
          -- on_attach = on_attach,
        }
      end,

      ["tailwindcss"] = function()
        lspconfig["tailwindcss"].setup {
          -- cmd = { "bunx", "tailwindcss-language-server", "--stdio" },
          capabilities = capabilities,
          completions = {
            completeFunctionCalls = true,
          },
          filetypes = { "php", "html", "typescriptreact", "javascriptreact", "blade", "markdown" },
        }
      end,

      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup {
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        }
      end,

      ["nil_ls"] = function()
        lspconfig["nil_ls"].setup {
          capabilities = capabilities,
          settings = {
            nil_ls = {
              formatter = {
                command = "nixpkgs-fmt",
              },
            },
          },
        }
      end,

      ["docker_compose_language_service"] = function()
        -- configure emmet language server
        local function set_filetype(pattern, filetype)
          vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufRead", "BufNewFile" }, {
            pattern = pattern,
            command = "set filetype=" .. filetype,
          })
        end

        set_filetype({ "docker-compose.yml", "docker-compose.yaml" }, "yaml.docker-compose")

        lspconfig["docker_compose_language_service"].setup {
          capabilities = capabilities,
          filetypes = { "yaml.docker-compose" },
          -- filetypes = { 'yml', 'yaml' },
        }
      end,

      -- ["ts_ls"] = function()
      --   require("lspconfig").ts_ls.setup {
      --     capabilities = capabilities,
      --     cmd = { "typescript-language-server", "--stdio" },
      --     settings = {
      --       completions = {
      --         completeFunctionCalls = true,
      --       },
      --       typescript = {
      --         inlayHints = {
      --           includeInlayParameterNameHints = "all",
      --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      --           includeInlayFunctionParameterTypeHints = true,
      --           includeInlayVariableTypeHints = true,
      --           includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      --           includeInlayPropertyDeclarationTypeHints = true,
      --           includeInlayFunctionLikeReturnTypeHints = true,
      --           includeInlayEnumMemberValueHints = true,
      --         },
      --       },
      --     },
      --
      --     root_dir = function(filename, bufnr)
      --       local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename)
      --       if denoRootDir then
      --         -- print('this seems to be a deno project; returning nil so that tsserver does not attach');
      --         return nil
      --         -- else
      --         -- print('this seems to be a ts project; return root dir based on package.json')
      --       end
      --
      --       return lspconfig.util.root_pattern "package.json"(filename)
      --     end,
      --     filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript" },
      --     single_file_support = false,
      --   }
      -- end,

      -- ["denols"] = function()
      --   require("lspconfig").denols.setup {
      --     capabilities = capabilities,
      --     root_dir = require("lspconfig.util").root_pattern "deno.json",
      --     init_options = {
      --       lint = true,
      --       unstable = true,
      --       suggest = {
      --         imports = {
      --           hosts = {
      --             ["https://deno.land"] = true,
      --             ["https://cdn.nest.land"] = true,
      --             ["https://crux.land"] = true,
      --           },
      --         },
      --       },
      --       filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript" },
      --     },
      --     on_attach = function()
      --       local active_clients = vim.lsp.get_active_clients()
      --       for _, client in pairs(active_clients) do
      --         -- stop tsserver if denols is already active
      --         if client.name == "ts_ls" then
      --           client.stop()
      --         elseif client.name == "typescript-tools" then
      --           client.stop()
      --         end
      --         -- if client.name == "tsserver" or client.name == "typescript-tools" then
      --         --   client.stop()
      --         -- end
      --       end
      --     end,
      --   }
      -- end,

      ["cssls"] = function()
        require("lspconfig").cssls.setup {
          capabilities = capabilities,
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
          filetypes = { "typescriptreact", "javascriptreact", "css" },
        }
      end,

      -- ["emmet_language_server"] = function()
      --   require("lspconfig").emmet_language_server.setup {
      --     capabilities = capabilities,
      --     filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript" },
      --   }
      -- end,

      ["gopls"] = function()
        require("lspconfig").gopls.setup {
          capabilities = capabilities,
          settings = {
            gopls = {
              hints = {
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
              },
            },
          },
          filetypes = { "go" },
        }
      end,

      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        }
      end,

      ["bashls"] = function()
        lspconfig["bashls"].setup {
          capabilities = capabilities,
          filetypes = { "sh", "zsh", "bash" },
        }
      end,


      ["ruff"] = function()
        lspconfig["ruff"].setup {
          capabilities = capabilities,
          filetypes = { "python" },
        }
      end,

      ["pyright"] = function()
        lspconfig["pyright"].setup {
          capabilities = capabilities,
          filetypes = { "python" },
        }
      end,
      --
      -- ["rust_analyzer"] = function()
      --   lspconfig["rust_analyzer"].setup {
      --     capabilities = capabilities,
      --     filetypes = { "rust" },
      --   }
      -- end,

      ["helm_ls"] = function()
        lspconfig["helm_ls"].setup {
          capabilities = capabilities, -- (Optional) Add LSP capabilities here if needed
          cmd = { "helm_ls", "serve" }, -- Command to start the Helm LS server
          filetypes = { "helm" }, -- Filetypes this server should handle
          root_dir = function(fname) -- Function to determine the root directory for Helm projects
            return util.root_pattern "Chart.yaml"(fname)
          end,
        }
      end,
    }

    local function clear_lsp_group()
      vim.diagnostic.reset()
      vim.lsp.buf.clear_references()
    end

    vim.keymap.set("n", "<leader>cl", clear_lsp_group, { desc = "Clear LSP group", silent = true })
  end,
}
