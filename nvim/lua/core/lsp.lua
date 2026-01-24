local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Show line diagnostics"
    keymap.set("n", "D", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Show inlay hint"
    keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
    end, opts)

    -- Toggle diagnostics virtual_text (and optionally virtual_lines) in one keymap
    local opts = { desc = "Toggle diagnostics virtual text" }
    vim.keymap.set("n", "<leader>it", function()
      local cfg = vim.diagnostic.config()
      local vt_enabled = (cfg.virtual_text ~= false)
      local next_vt = not vt_enabled

      vim.diagnostic.config {
        virtual_text = next_vt and { spacing = 2, prefix = "●" } or false,
        -- keep existing values for other fields
        virtual_lines = cfg.virtual_lines,
        underline = cfg.underline,
        update_in_insert = cfg.update_in_insert,
      }
    end, opts)

    local opts = { desc = "Toggle diagnostics virtual line" }
    vim.keymap.set("n", "<leader>iv", function()
      local cfg = vim.diagnostic.config()
      local enabled = (cfg.virtual_text ~= false) or (cfg.virtual_lines ~= false)
      local next = not enabled
      vim.diagnostic.config {
        virtual_text = next and { spacing = 2, prefix = "●" } or false,
        virtual_lines = next and { current_line = false, prefix = "●" } or false,
        underline = cfg.underline,
        update_in_insert = cfg.update_in_insert,
      }
    end, { desc = "Toggle diagnostics virtual UI (text + lines)" })

    opts.desc = "Show quickfix list"
    keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump { count = -1, float = true }
    end, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump { count = 1, float = true }
    end, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

-- vim.lsp.inlay_hint.enable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config {
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },

  -- virtual_text = { prefix = "●" },
  -- virtual_lines = { current_line = true, prefix = '●' },
  -- underline = true,
  -- update_in_insert = false,
  -- update_in_insert = true,
}
