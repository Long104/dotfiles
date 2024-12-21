-- https://github.com/epwalsh/obsidian.nvim

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',

    -- see below for full list of optional dependencies 👇
  },
  -- dir = '~/obsidian/NGNl',
  opts = {
    ui = { enable = false },
    disable_frontmatter = true,
    workspaces = {
      {
        name = 'work_space',
        path = '~/satori/note/ntn',
      },
      {
        name = 'stamford',
        path = '~/satori/note/stamford',
      },
      {
        name = 'code',
        path = '~/satori/note/code',
      },
      {
        name = 'second brain',
        path = '~/satori/note',
      },
      -- {
      --   name = 'todo_space',
      --   path = '~/obsedian/NGNl/todo',
      -- },

      -- notes_subdir = 'inbox',
      -- new_notes_location = 'notes_subdir',
      -- use outside of the workspace
      --  {
      --       name = "no-vault",
      --       path = function()
      --         -- alternatively use the CWD:
      --         -- return assert(vim.fn.getcwd())
      --         return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
      --       end,
      --       overrides = {
      --         notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
      --         new_notes_location = "current_dir",
      --         templates = {
      --           folder = vim.NIL,
      --         },
      --         disable_frontmatter = true,
      --       },
      --     },
      --   },
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
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    open_app_foreground = false,
    {

      -- templates = {
      --   folder = '~/obsedian/NGNL/workspace/templates',
      --   date_format = '%Y-%m-%d-%a',
      --   time_format = '%H:%M',
      -- },
    },

    -- the problem
    -- templates = {
    --   subdir = 'templates',
    --   date_format = '%m-%d-%Y',
    --   time_format = '%H:%M:%S',
    -- },
    templates = {
      subdir = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M:%S',
    },
  },
}
