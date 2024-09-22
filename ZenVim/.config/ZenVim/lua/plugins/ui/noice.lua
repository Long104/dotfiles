return {
  'folke/noice.nvim',

  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  -- event = { 'CmdlineEnter' },
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = false, -- enables the Noice messages UI
        -- view = "notify", -- default view for messages
        -- view_error = "notify", -- view for errors
        -- view_warn = "notify", -- view for warnings
        -- view_history = "messages", -- view for :messages
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
      popupmenu = { enabled = false },
      notify = { enabled = false },

      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        bottom_search = false, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = true, -- add a border to hover docs and signature help
        -- lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    }
    -- vim.keymap.set('n', '<leader>nd', '<cmd>Noice dismiss<cr>')
    -- vim.keymap.set("n", "<leader>nc", "<cmd>Noice disable<cr>")
    -- vim.keymap.set("n", "<leader>ne", "<cmd>Noice enable<cr>")
    vim.keymap.set('n', '<leader>nt', '<cmd>Noice telescope<cr>')
  end,
}
-- :Noice or :Noice history shows the message history
-- :Noice last shows the last message in a popup
-- :Noice dismiss dismiss all visible messages
-- :Noice errors shows the error messages in a split. Last errors on top
-- :Noice disable disables Noice
-- :Noice enable enables Noice
-- :Noice stats shows debugging stats
-- :Noice telescope opens message history in Telescope
