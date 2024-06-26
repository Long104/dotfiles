return {
  'shortcuts/no-neck-pain.nvim',
  config = function()
    require('no-neck-pain').setup {
      width = 90,
      buffers = {
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          -- set to `nil` to default
          -- to current working directory
          location = '~/obsedian/NGNl/test/',
        },
        bo = {
          filetype = 'md',
        },
      },
    }
  end,
}
