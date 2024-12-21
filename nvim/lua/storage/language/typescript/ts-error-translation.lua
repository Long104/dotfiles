return {
  'dmmulroy/ts-error-translator.nvim',
  -- event = 'BufReadPre',
  ft = { 'typescript', 'typescriptreact' },
  config = function()
    require('ts-error-translator').setup()
  end,
}
