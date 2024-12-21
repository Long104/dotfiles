return {
  'nyngwang/murmur.lua',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    require('murmur').setup {
      cursor_rgb = {
        -- guibg = '#ffffff',
        guibg = '#393939',
        -- guibg = '#fff4e6',
        -- guibg = '#005582',
        -- guibg = '#088F8F',
        -- guibg = '#89CFF0',
        -- guibg = '#A7C7E7',
        -- guibg = '#aec2d0',
        -- guibg = '#6C82D6',

        -- guibg = '#bc4749',
      },
    }
  end,
}
