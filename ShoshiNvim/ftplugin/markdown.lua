-- ~/.config/nvim/ftplugin/markdown.lua
-- Use Tree-sitter to compute folds for Markdown files
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldmethod = 'expr'

-- Optional: start with folds open (adjust to taste)
vim.wo.foldlevel = 99
vim.wo.foldenable = true
