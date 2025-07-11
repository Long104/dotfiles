-- Default options:
return {
  "webhooked/kanso.nvim",
  lazy = false,
  priority = 1000,
 config =  function ()
  require('kanso').setup({
  compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = {},
    typeStyle = {},
    disableItalics = false,
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    -- theme = "zen",              -- Load "zen" theme
    theme = "ink",              -- Load "zen" theme
    -- theme = "pearl",              -- Load "zen" theme
    background = {               -- map the value of 'background' option to a theme
        -- dark = "zen",           -- try "ink" !
        dark = "ink",           -- try "ink" !
        light = "pearl"
    },
})
-- setup must be called before loading
vim.cmd("colorscheme kanso")
-- vim.cmd("colorscheme kanso-pearl")
-- vim.cmd("colorscheme kanso-zen")
-- vim.cmd("colorscheme kanso-kage")
end
}
