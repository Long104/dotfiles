-- options
local opt = vim.opt
-- disable some default providers
-- vim.g.loaded_node_provider = 0
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_perl_provider = 0
-- vim.g.loaded_ruby_provider = 0
-- vim.opt.shadafile = "NONE"
opt.conceallevel=2
opt.concealcursor=''
opt.hidden = true
-- customize
opt.sessionoptions = { 'terminal', 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
--tab
-- vim.o.showtabline = 2
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- opt.laststatus = 3
opt.laststatus = 0
opt.showmode = false

opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
opt.cursorline = true
-- opt.cursorlineopt = 'number' -- only number
-- opt.cursorlineopt = 'line' -- only line
opt.cursorlineopt = 'both' -- or 'both' if you want both number and line

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = {
  diff = '╱',
  eob = ' ',
}
opt.ignorecase = true
opt.smartcase = true
-- opt.mouse = 'a'

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- disable nvim intro
opt.shortmess:append {
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
  q = true,
}

opt.signcolumn = 'yes'
opt.splitright = true
opt.splitbelow = true
opt.timeoutlen = 300
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns

vim.opt.updatetime = 200

-- lazy
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }
vim.g.lazygit_config = true
vim.g.deprecation_warnings = false

opt.grepformat = '%m'
opt.grepprg = 'rg --vimgrep'
opt.linebreak = true

opt.autowrite = false
opt.scrolloff = 10
opt.sidescrolloff = 25

opt.termguicolors = true
opt.wrap = false

--primega
-- opt.guicursor = ''
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.cmdheight = 1

-- vim.opt.formatoptions:remove { 'r', 'o' }
opt.breakindent = true
opt.hlsearch = true
opt.jumpoptions = 'view'
-- vim.opt.isfname:append("@-@")
