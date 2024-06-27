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
vim.opt.fillchars:append { eob = ' ' }

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

vim.opt.undofile = true
-- vim.opt.signcolumn = 'no'
-- Keep signcolumn on by default
vim.cmd 'set signcolumn=yes:1'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

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

-- vim.cmd('highlight link EndOfBuffer Ignore')

-- vim.opt.foldcolumn = "0"

vim.cmd 'set spelllang=en_us'

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
