-- options
local opt = vim.opt
opt.diffopt = "internal,filler,closeoff,linematch:60,algorithm:histogram,context:5"
opt.conceallevel = 2
opt.concealcursor = ""
opt.hidden = true
opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.incsearch = true

-- customize
opt.sessionoptions = { "terminal", "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.laststatus = 0
opt.showmode = false

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.cursorline = true

opt.cursorlineopt = "both" -- or 'both' if you want both number and line

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
-- opt.textwidth = 80
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = {
  diff = "╱",
  eob = " ",
}
opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.numberwidth = 2

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

opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.timeoutlen = 300
opt.undofile = true
opt.fileencoding = "utf-8"
opt.confirm = true

vim.opt.updatetime = 200

-- lazy
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.lazygit_config = true
vim.g.deprecation_warnings = false

opt.grepformat = "%m"
opt.grepprg = "rg --vimgrep"
opt.linebreak = true

opt.autowrite = false
opt.scrolloff = 10
opt.sidescrolloff = 25

opt.termguicolors = true
opt.wrap = false

--primega
opt.guicursor = ""
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.syntax = "on"
opt.cmdheight = 0

opt.breakindent = true
opt.hlsearch = true
opt.jumpoptions = "view"
