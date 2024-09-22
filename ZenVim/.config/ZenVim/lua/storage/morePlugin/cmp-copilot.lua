
return {
  'zbirenbaum/copilot-cmp',
  -- event = 'InsertEnter',
  event = { 'InsertEnter', 'LspAttach' },
  config = function()
    require('copilot_cmp').setup {
      fix_pairs = true,
    }
  end,
}
