
return {
  'razak17/tailwind-fold.nvim',
  keys = { {
    '<leader>tf',
    '<cmd>TailwindFoldToggle<cr>',
    desc = 'Toggle Tailwind Fold',
  } },
  opts = {
    enabled = true,
    symbol = '…', -- 󱏿
    highlight = {
      fg = '#38BDF8', -- [[ symbol color ]]
    },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'javascriptreact', 'php', 'blade' },
}
