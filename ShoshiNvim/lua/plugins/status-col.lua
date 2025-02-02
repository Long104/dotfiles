return {
  'luukvbaal/statuscol.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    -- local builtin = require("statuscol.builtin")
    local builtin = require 'statuscol.builtin'

    vim.cmd [[
  highlight FoldOpenText guifg=#00FF00 guibg=#000000
  highlight FoldClosedText guifg=#FF0000 guibg=#000000
]]
    -- Define highlight groups in Lua
    require('statuscol').setup {
      relculright = true,
      segments = {

        -- { text = { ' ' }, click = 'v:lua.ScFa' },
        {
          -- sign = { namespace = { 'diagnostic/signs' }, maxwidth = 2, auto = true },
          sign = { namespace = { '.*' }, maxwidth = 2, auto = true },
          click = 'v:lua.ScSa',
        },

        {
          sign = { name = { '.*' }, maxwidth = 1, colwidth = 1, auto = true },
          click = 'v:lua.ScSa',
          -- text = { ' ' }, -- Space after the fold symbol
        },

        { text = { ' ' }, click = 'v:lua.ScFa' },
        -- { text = { ' ' }, click = 'v:lua.ScFa' },
        {
          text = { builtin.lnumfunc },
          click = 'v:lua.ScLa',
          -- hl = 'FoldOpenText'
        },
        {
          text = { ' ', builtin.foldfunc, ' ' },
          -- text = { ' ⏵ ' },
          click = 'v:lua.ScFa',
        },
        -- {
        --   sign = { name = { '.*' }, maxwidth = 1, colwidth = 1, auto = true },
        --   click = 'v:lua.ScSa',
        --   -- text = { ' ' }, -- Space after the fold symbol
        -- },
      },
    }
  end,
}
