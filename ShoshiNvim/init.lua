require 'core'
-- lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  spec = {
    { import = 'plugins' },
    { import = 'plugins.ai' },
    -- { import = 'plugins.game' },
    { import = 'plugins.auto' },
    { import = 'plugins.colorschemes' },
    { import = 'plugins.lsp' },
    { import = 'plugins.note' },
    { import = 'plugins.ui' },
  },
  -- defaults = {
  --     lazy = false,
  --     version = false,
  --   },
  checker = {
    -- enabled = true, -- check for plugin updates periodically
    --
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  change_detect = {
    -- enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'rplugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'shada',
        -- 'editorconfig',
        -- 'man',
        --'osc52',
        --'spellfile'
      },
    },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
      loaded = '',
      not_loaded = '',
    },
  },
})

require 'core.keymaptest'
require 'core.highlight'
require 'core.transparent'

package.path = package.path .. ';/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua'
package.cpath = package.cpath .. ';/usr/local/lib/lua/5.1/?.so'

