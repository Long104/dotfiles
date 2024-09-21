
return {

  keys = {{
    mode = "n",'<leader>at',':Atac<CR>',desc = "Atac",
  }},
  'NachoNievaG/atac.nvim',
  dependencies = { 'akinsho/toggleterm.nvim' },
  config = function()
    require('atac').setup {
      dir = '~/PlayCodeChess/atac/', -- By default, the dir will be set as /tmp/atac
    }
  end,
}
