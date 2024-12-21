
return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {mode = 'n', '<leader>ftc', '<cmd>TodoTelescope<cr>', desc = 'find todos' },
    {mode = "n", "<leader>tt", "<cmd>TodoTelescope keywords=TODO<cr>",  desc = "[P]TODO list (Telescope)" },
    {mode = "n", "<leader>tp", "<cmd>TodoTelescope keywords=DOING<cr>",  desc = "[P]DOING list (Telescope)" },
    {mode = "n", "<leader>td", "<cmd>TodoTelescope keywords=DONE<cr>",  desc = "[P]DONE list (Telescope)" },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local keymap = vim.keymap -- for conciseness
    local status_ok, todo_comments = pcall(require, 'todo-comments')
    if not status_ok then
      print 'Error loading todo-comments'
      return
    end

    -- TODO: Add more keywords
    -- DOING: why is this not working
    -- DONE: this is working
    -- EXPLAIN:
    -- WHAT:
    -- NOTE:
    -- INFO:
    -- FIX:
    -- BUG:
    -- FIXIT:
    -- ERROR:
    -- WARNING:
    -- HACK:
    -- WARN:
    -- PERF:
    -- OPTIMIZE:
    -- TEST:
    -- HACKS:

    -- set keymaps
    keymap.set('n', ']t', function()
      todo_comments.jump_next()
    end, { desc = 'Next todo comment' })

    keymap.set('n', '[t', function()
      todo_comments.jump_prev()
    end, { desc = 'Previous todo comment' })



    todo_comments.setup {
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = 'error', -- can be a hex color, or a named color (see below)
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = ' ', color = 'info' },
        EXPLAIN = { icon = ' ', color = 'explain' },
        WHAT = { icon = ' ', color = 'what' },
        DOING = { icon = '', color = 'doing' },
        DONE = { icon = ' ', color = 'done' },
        HACK = { icon = ' ', color = 'warning' },
        HACKS = { icon = ' ', color = 'default' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        ERROR = { icon = ' ', color = 'error', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
      colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
        warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
        info = { 'DiagnosticInfo', '#2563EB' },
        done = { 'done', '#90e0ef' },
        doing = { 'doing', '#4895ef' },
        explain = { 'explain', '#f4a261' },
        what = { 'what', '#6a994e' },
        hint = { 'DiagnosticHint', '#10B981' },
        default = { 'Identifier', '#7C3AED' },
        test = { 'Identifier', '#FF00FF' },
      },
    }
  end,
}
