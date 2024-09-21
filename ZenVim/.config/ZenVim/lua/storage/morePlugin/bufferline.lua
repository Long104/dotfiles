return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    local opts = function(desc)
      return { desc = desc, noremap = true, silent = true }
    end
    local keymap = vim.keymap.set
    require('bufferline').setup {

      options = {

        indicator_icon = '▎',

        style = 'none',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
        custom_filter = function(buf_number)
          if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
            return true
          end
        end,
        -- sort_by = function(buffer_a, buffer_b)
        --   local mod_a = ((vim.loop.fs_stat(buffer_a.path) or {}).mtime or {}).sec or 0
        --   local mod_b = ((vim.loop.fs_stat(buffer_b.path) or {}).mtime or {}).sec or 0
        --   return mod_a > mod_b
        -- end,

        enforce_regular_tabs = true,
        separator_style = 'slope',
        -- separator_style = 'slant',

        diagnostics = 'nvim_lsp',

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
            s = s .. n .. sym
          end
          return s
        end,
      },
    }

    -- buffer
    keymap('n', 'bd', '<cmd>bp|bd #<CR>', opts 'Close current tab')
    keymap('n', 'ba', '<cmd>%bd|e#|bd#<CR>', opts 'Close all tab only the one not')
    keymap('n', '<Tab>', '<cmd>bn<CR>', opts 'Go to previous tab')
    keymap('n', '<S-Tab>', '<cmd>bp<CR>', opts 'Go to previous tab')
    keymap('n', '<bf>', '<cmd>BufferLinePick<CR>', opts 'buffer line pick')
    keymap('n', '<bg>', ':BufferLineGoToBuffer', opts 'buffer line pick')

    -- tabs
    keymap('n', 'ta', '<cmd>tabonly<cr>', opts 'close all tab')
    keymap('n', 'X', '<cmd>tabclose<cr>', opts 'tab close')
    keymap('n', 't', '<cmd>tabedit<cr>', opts 'create')
    keymap('n', 'tl', '<cmd>tabs<cr>', opts 'view all tab')
    keymap('n', '<S-k>', '<cmd>tabn<cr>', opts 'tabnext')
    keymap('n', '<S-j>', '<cmd>tabp<cr>', opts 'tabprev')
  end,
}
