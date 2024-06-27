return {
  'nyngwang/murmur.lua',
  config = function()
    require('murmur').setup {
      cursor_rgb = {
        -- guibg = '#ffffff',
        guibg = '#393939',
        -- guibg = '#bc4749',
      },
    }
  end,
}
