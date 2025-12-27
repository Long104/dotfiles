return {
  'folke/noice.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', "CmdlineEnter" },
  opts = {
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('noice').setup {
      messages = {
        enabled = false, -- enables the Noice messages UI
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    }
  end,
}
