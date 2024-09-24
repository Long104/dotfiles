--
-- vim.g.loaded_matchparen = 1
-- vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.o.background = "dark"
-- number

-- vim.opt.shadafile = 'NONE'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.showmode = false
vim.opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
vim.opt.autowrite = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'nosplit'
vim.opt.hlsearch = true
vim.opt.spelllang = 'en_us'
vim.opt.smoothscroll = true
-- vim.opt.spelllang = { 'en' }

vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.cmdheight = 1

vim.opt.signcolumn = 'yes'
-- vim.opt.cmdheight = 0
-- vim.opt.cmdheight=2
vim.opt.smarttab = true
-- vim.opt.charset = 'utf-8'
vim.opt.encoding = 'utf-8'
-- vim.opt.fileencoding = 'utf-8'
-- vim.opt.trim_trailing_whitespace = true
-- vim.opt.insert_final_newline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 25

vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
-- vim.opt.shiftround = true
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.softtabstop = 2 -- 2 spaces for tab
vim.opt.autoindent = true -- copy indent from current line when starting new one
-- vim.opt.cursorline = true -- highlight the current cursor line
vim.opt.termguicolors = true
-- vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position  vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position
vim.opt.swapfile = false

-- disable nvim intro
-- Lua configuration for Neovim
vim.opt.shortmess:append {
  W = true,
  I = true,
  c = true,
  C = true,
  s = true,
  a = true,
  o = true,
  O = true,
  T = true,
  F = true,
  f = true,
  i = true,
  t = true,
  m = true,
  S = false,
  A = false,
}
-- vim.opt.pumheight = 0
-- vim.opt.shortmess = 'acFfIitm'
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }
vim.g.deprecation_warnings = false

vim.opt.updatetime = 300
-- vim.opt.whichwrap:append '<>[]hl'
vim.opt.mouse = 'a'
vim.opt.statusline = '2'
vim.opt.laststatus = 0
-- vim.opt.laststatus = 3
-- highlight winsepartor guibg = none
vim.opt.linebreak = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
vim.opt.virtualedit = 'block'
vim.opt.wildmode = 'longest:full,full'
-- vim.opt.winminwidth = 5

-- fold
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldmethod = 'manual'

vim.opt.foldcolumn = '1' -- '0' is not bad Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.timeoutlen = 300
vim.opt.jumpoptions = 'view'

vim.opt.fillchars = {
  -- foldopen = ' ',
  -- foldopen = '',
  -- foldclose = '',
  foldopen = '▼',
  foldclose = '⏵',
  -- foldopen = '󰁙',
  -- foldclose = '󰁊', fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
vim.o.textwidth = 80
-- vim.opt.colorcolumn = '80'
-- vim.opts.textwidth = 80
-- vim.g.autoformat = true
-- Set format program (optional, adjust as needed)

vim.opt.formatoptions = 'jcroqlnt' -- tcqj

-- vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
-- vim.opt.pumblend = 10 -- Popup blend
-- vim.opt.pumheight = 10 -- Maximum number of entries in a popup

-- vim.g.markdown_recommended_style = 0
-- vim.opts.nofsync = 0
vim.g.markdown_recommended_style = 0
