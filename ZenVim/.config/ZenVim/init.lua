
require 'core'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    -- basic need
    { import = 'plugins' },

    -- lsp
    { import = 'plugins.lsp' },
    { import = 'plugins.lsp.golang' },
    { import = 'plugins.lsp.typescript' },

    -- ai
    { import = 'plugins.ai' },

    -- ui
    { import = 'plugins.ui' },
    { import = 'plugins.ui.colorschemes' },
    { import = 'plugins.auto' },

    -- utility
    -- { import = 'plugins.utility.debug' },
    -- { import = 'plugins.utility.database' },
    -- { import = 'plugins.utility.test' },
    { import = 'plugins.utility' },

    -- git
    { import = 'plugins.git' },

    -- extra storage for plugins
    -- { import = 'storage.bufferline' },
    -- { import = 'storage.bufferAndTab' },
    -- { import = 'storage.oil' },
    -- { import = 'storage.snipe' },
    { import = 'storage.flash' },
    -- { import = 'storage.harpoon' },
    -- { import = 'storage.todo-comment' },
  },
  checker = {
    notify = false,
  },
  change_detect = {
    notify = false,
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  -- install = { colorscheme = { "tokyonight", "habamax" } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        -- "matchparen",
        'netrwPlugin',
        'rplugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'spellfile',
        -- 'shada',
        'editorconfig',
      },
    },
  },
}

-- transparent background
require 'core.builtin'
