return {
  'tomasky/bookmarks.nvim',
  -- after = "telescope.nvim",
  -- event = 'VimEnter',
  -- cmd = 'Bookmark',
  keys = {
    {
      mode = 'n',
      'mm',
      function()
        require('bookmarks').bookmark_toggle()
      end,
      desc = 'bookmark toggle',
    },
    {
      mode = 'n',
      'mi',
      function()
        require('bookmarks').bookmark_ann()
      end,
      desc = 'bookmark insert',
    },
    {
      mode = 'n',
      'mc',
      function()
        require('bookmarks').bookmark_clean()
      end,
      desc = 'bookmark clean',
    },
    {
      mode = 'n',
      'mn',
      function()
        require('bookmarks').bookmark_next()
      end,
      desc = 'bookmark next',
    },
    {
      mode = 'n',
      'mp',
      function()
        require('bookmarks').bookmark_prev()
      end,
      desc = 'bookmark prev',
    },
    {
      mode = 'n',
      'ma',
      function()
        require('bookmarks').bookmark_list()
      end,
      desc = 'bookmark list',
    },
    {
      mode = 'n',
      'ml',
      '<cmd>Telescope bookmarks list<cr>',
      desc = 'telescope bookmark list',
    },
  },
  config = function()
    require('bookmarks').setup {
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand '$HOME/.bookmarks', -- bookmarks save file path
      keywords = {
        ['@t'] = '☑️ ', -- mark annotation startswith @t ,signs this icon as `Todo`
        ['@w'] = '⚠️ ', -- mark annotation startswith @w ,signs this icon as `Warn`
        ['@f'] = '⛏ ', -- mark annotation startswith @f ,signs this icon as `Fix`
        ['@n'] = ' ', -- mark annotation startswith @n ,signs this icon as `Note`
      },
      -- on_attach = function(bufnr)
      --   local bm = require 'bookmarks'
      --   local map = vim.keymap.set
      --   map('n', 'mm', bm.bookmark_toggle) -- add or remove bookmark at current line
      --   map('n', 'mi', bm.bookmark_ann) -- add or edit mark annotation at current line
      --   map('n', 'mc', bm.bookmark_clean) -- clean all marks in local buffer
      --   map('n', 'mn', bm.bookmark_next) -- jump to next mark in local buffer
      --   map('n', 'mp', bm.bookmark_prev) -- jump to previous mark in local buffer
      --   map('n', 'ma', bm.bookmark_list) -- show marked file list in quickfix window
      --   map('n', 'ml', '<cmd>Telescope bookmarks list<cr>') -- show marked file list in quickfix window
      -- end,
    }
  end,
}
