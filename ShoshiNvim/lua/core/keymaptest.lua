-- vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'toggle file explorer' }) -- toggle file explorer
--
-- vim.keymap.set('n', 'er', '<cmd>NvimTreeRefresh<cr>', { desc = 'toggle file explorer' }) -- toggle file explorer

vim.keymap.set('n', '<leader>fz', '<cmd>Telescope frecency<cr>', { desc = 'Frecency' })
vim.keymap.set('n', '<leader>famf', '<cmd>Telescope media_files<cr>', { desc = 'media files' })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ftl', '<cmd>Telescope builtin<cr>', { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope bookmarks<cr>', { desc = 'serach treesitter' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope advanced_git_search<cr>', { desc = 'serach treesitter' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope treesitter<cr>', { desc = 'serach treesitter' })
vim.keymap.set('n', '<leader>fha', 'Telescope help_tags', { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope buffers<cr>', { desc = 'find buffer' })
vim.keymap.set('n', '<leader><leader>', 'Telescope resume', { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<cr>', { desc = 'in path' })
vim.keymap.set('n', '<leader>fp', ':Telescope file_browser path=%:p:h select_buffer=true<cr>', { desc = 'current' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'fuzzy find files in cwd' })
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'fuzzy find recent files' })
vim.keymap.set('n', '<leader>fl', '<cmd>Telescope live_grep<cr>', { desc = 'find string in cwd', silent = true })
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', { desc = 'find string under cursor in cwd' })
vim.keymap.set('n', '<leader>ftc', '<cmd>TodoTelescope<cr>', { desc = 'find todos' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fM', '<cmd>Telescope marks<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fgc', '<cmd>Telescope advanced_git_search checkout_reflog<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fgd', '<cmd>Telescope advanced_git_search diff_branch_file<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fgb', '<cmd>Telescope advanced_git_search changed_on_branch<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fgsc', '<cmd>Telescope advanced_git_search search_log_content<cr>', { noremap = true })

vim.keymap.set('n', '<leader>fgsl', '<cmd>Telescope advanced_git_search search_log_content_file<cr>', { noremap = true })
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
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian [O]pen' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'obsidian [B]acklinks' })
vim.keymap.set('n', '<leader>otd', '<cmd>ObsidianToday<CR>', { desc = '[O]bsidian [T]o[d]ay' })
vim.keymap.set('n', '<leader>otm', '<cmd>ObsidianTomorrow<CR>', { desc = '[O]bsidian [T]o[m]orrow' })
vim.keymap.set('n', '<leader>oyd', '<cmd>ObsidianYesterday<CR>', { desc = '[O]bsidesc = dian [y]ester[d]ay' })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'O]bsidian [S]earch' })
vim.keymap.set('n', 'gf', function()
  if require('obsidian').util.cursor_on_markdown_link() then
    return '<cmd>ObsidianFollowLink<CR>'
  else
    return 'gf'
  end
end, { noremap = false, expr = true })

-- keymap('n', '<leader>a', function()
--   nvim_tree_api.tree.toggle { path = '<args>', find_file = false, update_root = false, focus = true }
-- end, opts 'some desc')

vim.api.nvim_clear_autocmds { event = 'BufLeave', pattern = '*.md' }

-- Check if a templatje directory is set and ensure it exists
vim.g.template_directory = '~/obsedian/NGNl/'
