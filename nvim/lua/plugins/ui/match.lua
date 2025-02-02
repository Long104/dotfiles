return {
  'utilyre/sentiment.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = {
    -- config
  },
  init = function()
    -- `matchparen.vim` needs to be disabled manually in case of lazy loading
    vim.g.loaded_matchparen = 1
  end,
}
