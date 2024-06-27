return {

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    -- lazy = true, -- Load on an autocmd event or command
    event = 'VeryLazy',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },

    config = function()
      require('CopilotChat').setup {
        debug = true, -- Enable debugging
        show_help = false, -- See Configuration section for rest
        -- See Configuration section for rest
        prompts = {
          Error = {
            prompt = '/COPILOT_EXPLAIN the code do not work please fix this for me and explain why it do not work.',
          },
          -- Review = {
          --   prompt = '/COPILOT_REVIEW Review the selected code.',
          --   callback = function(response, source)
          --   end,
          -- },
        },
      }
    end,

    -- Quick chat with Copilot
    -- See Commands section for default commands if you want to lazy load on them
    vim.keymap.set({ 'n', 'x' }, '<leader>aia', ':CopilotChat ', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'n', 'x' }, '<leader>air', '<cmd>CopilotChatReset<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'n', 'x' }, '<leader>ait', '<cmd>CopilotChatToggle<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'n', 'x' }, '<leader>aid', '<cmd>CopilotChatDebugInfo<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aie', '<cmd>CopilotChatExplain<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aicr', '<cmd>CopilotChatReview<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aif', '<cmd>CopilotChatFix<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aio', '<cmd>CopilotChatOptimize<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aicd', '<cmd>CopilotChatDocs<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aict', '<cmd>CopilotChatTests<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aice', '<cmd>CopilotChatError<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aicf', '<cmd>CopilotChatFixDiagnostic<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aicc', '<cmd>CopilotChatCommit<cr>', { desc = 'Send line to Copilot' }),
    vim.keymap.set({ 'x', 'n' }, '<leader>aics', '<cmd>CopilotChatCommitStaged<cr>', { desc = 'Send line to Copilot' }),
  },
}
