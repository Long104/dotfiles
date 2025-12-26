local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.ai" },
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.mini" },
    { import = "plugins.snack" },

    -- theme
    -- { import = "plugins.ui.theme.github" },
    { import = "plugins.theme.kanagawa" },

  },
  checker = {
    notify = false,
    enabled = true,
  },
  change_detect = {
    notify = false,
  },
  -- defaults = {
  --   lazy = false,
  --   version = true, -- always use the latest git commit
  -- },
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
