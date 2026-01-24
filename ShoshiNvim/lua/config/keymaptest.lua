vim.keymap.set('n', '<leader>i', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end)
vim.keymap.set('n', '<leader>qa', '<cmd>wqa!<cr>', { desc = 'toggle file explorer' }) -- toggle file explorer

vim.keymap.set('n', 'tl', '<cmd>tabn<cr>', { desc = 'tabnext' })
vim.keymap.set('n', 'tp', '<cmd>tabp<cr>', { desc = 'tabprev' })
-- vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>', { desc = 'tabnext' })
vim.keymap.set('n', 'td', '<cmd>tabnew<cr>', { desc = 'tabnext' })

-- obsidian
-- :ObsidianNew [TITLE]
--:ObsidianQuickSwitch
--:ObsidianTags [TAG ...]
--:ObsidianDailies [OFFSET ...]
--ObsidianTemplate [NAME]
--:ObsidianWorkspace [NAME]
--:ObsidianPasteImg [IMGNAME]
--:ObsidianRename [NEWNAME] [--dry-run]
--:ObsidianToggleCheckbox
--:ObsidianNewFromTemplate [TITLE]
--:ObsidianTOC
vim.keymap.set('n', '<leader>oo', '<cmd>Obsidian Open<CR>', { desc = '[O]bsidian [O]pen' })
vim.keymap.set('n', '<leader>ob', '<cmd>Obsidian Backlinks<CR>', { desc = 'obsidian [B]acklinks' })
vim.keymap.set('n', '<leader>otd', '<cmd>Obsidian Today<CR>', { desc = '[O]bsidian [T]o[d]ay' })
vim.keymap.set('n', '<leader>otm', '<cmd>Obsidian Tomorrow<CR>', { desc = '[O]bsidian [T]o[m]orrow' })
vim.keymap.set('n', '<leader>oyd', '<cmd>Obsidian Yesterday<CR>', { desc = '[O]bsidesc = dian [y]ester[d]ay' })
vim.keymap.set('n', '<leader>os', '<cmd>Obsidian Search<CR>', { desc = 'O]bsidian [S]earch' })

-- keymap('n', '<leader>a', function()
--   nvim_tree_api.tree.toggle { path = '<args>', find_file = false, update_root = false, focus = true }
-- end, opts 'some desc')

vim.api.nvim_clear_autocmds { event = 'BufLeave', pattern = '*.md' }

-- Check if a templatje directory is set and ensure it exists
vim.g.template_directory = '~/obsedian/NGNl/'
