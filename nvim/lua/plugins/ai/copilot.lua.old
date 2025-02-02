return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = true, auto_refresh = false },
      filetypes = {
        yaml = true,
        markdown = true,
        javascript = true, -- allow specific filetype
        typescript = true, -- allow specific filetype
      },
    }
  end,
}
