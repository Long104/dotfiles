return {
  'Ron89/thesaurus_query.vim',
  keys = {
    {
      mode = 'n',
      '<leader>syc',
      '<cmd>ThesaurusQueryLookupCurrentWord<cr>',
    },
    {
      mode = 'n',
      '<leader>syr',
      '<cmd>ThesaurusQueryReplaceCurrentWord<cr>',
    },
  },
  config = function()
    -- require("thesaurus_query")
  end,
}
