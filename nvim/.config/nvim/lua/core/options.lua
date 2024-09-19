vim.api.nvim_create_user_command('GitRefresh', function()
  vim.cmd 'e'
  vim.cmd 'bufdo e'
  vim.cmd 'NvimTreeRefresh'
end, {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
-- vim.opt.fillchars:append { eob = ' ' }
-- vim.opt.fillchars:append { eob = '~' }

vim.opt.smartindent = true -- Insert indents automatically

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.

--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true
-- vim.cmd [[highlight CursorLineNr guifg=#FFD700 gui=bold]] -- Bold and gold for the current line number
-- vim.cmd [[highlight LineNr guifg=#808080]]
vim.opt.undofile = true
-- vim.opt.signcolumn = 'no'
-- vim.opt.signcolumn = 'yes'
-- Keep signcolumn on by default
-- vim.cmd 'set signcolumn=yes:1'

-- vim.opt.signcolumn = 'number'

-- vim.opt.relculright = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Decrease update time
-- vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
-- vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- vim.keymap.set('n', '<leader>ss', '<cmd>:set spell!<CR>', { desc = 'Toggle spell check' })
vim.opt.spelllang = 'en_us'

vim.opt.cmdheight = 0 -- height of the command bar
vim.opt.smarttab = true -- make tab insert indents in leading whitespace
-- vim.opt.showcmd = true -- display
-- vim.opt.backup = false
-- vim.opt.laststatus = 2 -- always show status line

vim.opt.scrolloff = 10
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.cursorline = true -- highlight the current cursor line
vim.opt.termguicolors = true
-- vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- turn off swapfile
-- vim.opt.swapfile = false
-- vim.opt.shortmess = 'a'

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
}
-- vim.opt.shortmess = 'acFfIitm'
vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 4
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'manual'
-- vim.opt.foldmethod = 'manual'
-- vim.opt.foldtext = ' '
-- vim.opt.foldcolumn = '1'
-- vim.o.foldenable = true
vim.opt.foldcolumn = '1' -- '0' is not bad
-- vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.jumpoptions = 'view'
-- vim.cmd 'highlight FoldColumn guibg=NONE'
-- vim.cmd 'highlight SignColumn guibg=NONE'
--
vim.opt.textwidth = 80
--

-- Function to set up folding for markdown files all in
-- local function setup_markdown_folding()
--   -- Set foldmethod and foldexpr for markdown
--   vim.opt_local.foldmethod = 'expr'
--   vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
--   -- vim.opt_local.foldlevelstart = 1
--   vim.opt_local.foldcolumn = '2'
--
--   -- Automatically close all folds when opening a markdown file
--   vim.cmd 'normal! zM'
-- end
--
-- -- Apply the function to markdown files
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   callback = setup_markdown_folding,
-- })

--
-- vim.opt.foldmethod = 'manual'
-- vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- vim.opt.foldcolumn = '1'
-- vim.opt.nofoldenable = true
-- vim.opt.foldenable = true

-- vim.opt.sessionoptions = {
--   'buffers',
--   'curdir',
--   'tabpages',
--   'winsize',
--   'help',
--   'globals',
--   'skiprtp',
--   'folds',
--   'localoptions',
-- }
--
--
vim.opt.fillchars = {
  foldopen = ' ',
  -- foldopen = '',
  -- foldclose = '',
  -- foldopen = '▼',
  foldclose = '⏵',
  -- foldopen = '󰁙',
  -- foldclose = '󰁊',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
-- Options for the LazyVim statuscolumn
-- n: Normal mode (when you're just navigating around).
-- v: Visual mode (when you're selecting text).
-- i: Insert mode (when you're typing text).
-- c: Command line mode (like when you're searching).

-- Set custom status column
-- Define the Lua function to generate fold information for the status column
-- Make the function global by assigning it to the _G (global) table

-- Set custom status column to include a space after the relative number
-- vim.opt.statuscolumn = "%l %s%{v:relnum?v:relnum:''}"
--
-- Set custom status column to include a space before the relative number

-- Define your custom fold handler and display functions
vim.opt.formatoptions = 'jcroqlnt' -- tcqj
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
