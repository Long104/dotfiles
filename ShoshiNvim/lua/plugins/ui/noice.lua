return {
  'folke/noice.nvim',

  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', "CmdlineEnter" },
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
      messages = { enabled = false },
      popupmenu = { enabled = false },
      notify = { enabled = false },

      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- -- lsp_doc_border = false, -- add a border to hover docs and signature help
        -- lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    }
    vim.keymap.set('n', '<leader>nd', '<cmd>Noice dismiss<cr>')
    -- vim.keymap.set("n", "<leader>nc", "<cmd>Noice disable<cr>")
    -- vim.keymap.set("n", "<leader>ne", "<cmd>Noice enable<cr>")
    vim.keymap.set('n', '<leader>nt', '<cmd>Noice telescope<cr>')
  end,
}
