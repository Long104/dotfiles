return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ft = 'markdown',
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    -- ui = { enable = false },
    -- disable_frontmatter = true,
    workspaces = {
      {
        name = 'work_space',
        path = '~/satori/note/shoshin',
      },
      {
        name = 'note',
        path = '~/satori/note/dailyNote/',
      },
      {
        name = 'todo',
        path = '~/satori/note/todo',
      },
      {
        name = 'second brain',
        path = '~/satori/note',
      },
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = 'dailyNote',
      -- folder = "notes/dailies",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = '%B %-d, %Y',
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
      -- template = "note",
      default_tags = { 'daily-notes' },
    },

    templates = {
      subdir = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M:%S',
    },
  },
}
