require "core"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    -- plugin
    { import = "plugins" },
    -- game
    { import = "storage.morePlugin.game.leetcode" },
    -- { import = "storage.morePlugin.nvzone.typr" },

    -- lsp
    { import = "plugins.lsp" },

    -- ai
    { import = "plugins.ai" },
    -- { import = 'storage.morePlugin.ollama' },
    -- { import = 'storage.morePlugin.futago' },
    -- { import = 'storage.morePlugin.gen' },
    -- { import = 'storage.morePlugin.gemini' },
    -- { import = 'storage.morePlugin.backseat' },

    -- ui
    { import = "plugins.ui" },

    -- colorschemes
    -- { import = "plugins.ui.colorschemes.kanso" },
    -- { import = 'plugins.ui.colorschemes.kanagawa-paper' },
    -- { import = "plugins.ui.colorschemes.kanagawa" },
    { import = "plugins.ui.colorschemes.kanagawa-transparent" },
    -- { import = 'plugins.ui.colorschemes.catppuccin' }, { import = 'plugins.ui.colorschemes.primepuccin' },
    -- { import = 'plugins.ui.colorschemes.oxocarbon' },
    -- { import = 'plugins.ui.colorschemes.mini-colors' },
    -- { import = 'plugins.ui.colorschemes.nord' },
    -- { import = 'plugins.ui.colorschemes.sakura' },
    -- { import = 'plugins.ui.colorschemes.vscode' },
    -- { import = 'plugins.ui.colorschemes.tokyo-dark' },
    -- { import = 'plugins.ui.colorschemes.tokyo-night-custom' },
    -- { import = 'plugins.ui.colorschemes.tokyo-night' },

    -- utility
    { import = "plugins.utility.http" },
    -- { import = 'plugins.utility.likepostman' },
    -- { import = "plugins.utility.database" },
    { import = "plugins.utility.refactor" },
    { import = "plugins.utility.devops" },

    -- test
    -- { import = 'plugins.utility.test' },

    --  debug
    -- { import = 'plugins.utility.debug' },
    --
    -- git
    { import = "plugins.git" },

    -- extra storage for language
    -- go
    { import = "storage.language.go" },
    -- { import = "storage.language.go.test" },
    -- { import = "storage.language.go.debug" },

    -- typescript
    { import = "storage.language.typescript" },
    -- { import = 'storage.language.typescript.debug' },
    -- { import = 'storage.language.typescript.test' },

    -- R
    -- { import = "storage.language.R" },
    -- { import = "storage.morePlugin.csvview" },

    -- extra storage for plugins
    { import = "storage.morePlugin.namu" },
    -- { import = "storage.morePlugin.code-snap" },
    { import = "storage.morePlugin.oil" },
    { import = "storage.morePlugin.snipe" },
    { import = "storage.morePlugin.flash" },
    { import = "storage.morePlugin.grapple" },
    -- { import = "storage.morePlugin.grug" },
    { import = "storage.morePlugin.todo-comment" },
    { import = "storage.morePlugin.bookmark" },
    { import = "storage.morePlugin.treesj" },
    -- { import = "storage.morePlugin.hardtime" },
    -- { import = 'storage.morePlugin.outline' },
    -- { import = 'storage.morePlugin.glance' },
    -- { import = "storage.morePlugin.neo-clip" },
    { import = "storage.morePlugin.which" },
    -- { import = "storage.morePlugin.flote" },
    { import = "storage.morePlugin.render-markdown" },
    -- { import = "storage.morePlugin.image-clip" },
    -- { import = "storage.morePlugin.image" },
    -- { import = "storage.morePlugin.lazyDo" },
    -- { import = "storage.morePlugin.nvzone.minty" },
    -- { import = "storage.morePlugin.nvzone.showkey" },
    -- { import = "storage.morePlugin.nvzone.timerly" },
    -- { import = "storage.morePlugin.note2cal" },

    -- more zen
    { import = "storage.morePlugin.zen-mode" },
    -- { import = 'storage.morePlugin.twilight' },
    -- { import = "storage.morePlugin.tiny-glimmer" },
    -- { import = "storage.morePlugin.bufferline" },
    -- { import = "storage.morePlugin.competitest" },
    -- { import = "storage.morePlugin.smear-cursor" },
    -- { import = "storage.morePlugin.neoscroll" },
    -- { import = "storage.morePlugin.picvim" },
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
        "gzip",
        "matchit",
        -- "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "spellfile",
        -- 'shada',
        "editorconfig",
      },
    },
  },
}

-- transparent background
require "core.transparent"
