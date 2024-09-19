
return {
  'nvim-treesitter/nvim-treesitter',
  'EmranMR/tree-sitter-blade',
  event = { 'BufReadPost', 'BufNewFile', 'VeryLazy', 'BufWritePost' },
  build = ':TSUpdate',
  config = function()
require('nvim-treesitter-blade').setup ()

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }
    -- Other Treesitter settings
  end,
}
