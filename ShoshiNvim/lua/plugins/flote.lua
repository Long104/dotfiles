return {
  'JellyApple102/flote.nvim',
  keys = {
    {
      mode = 'n',
      '<leader>nm',
      '<cmd>Flote manage<CR>',
      { noremap = true, silent = true },
    },
    {
      mode = 'n',
      '<leader>np',
      '<cmd>Flote<CR>',
      { noremap = true, silent = true },
    },
    {
      mode = 'n',
      '<leader>ng',
      '<cmd>Flote global<CR>',
      { noremap = true, silent = true },
    },
  },
  config = function()
    -- defaults
    require('flote').setup {
      q_to_quit = true,
      window_style = 'minimal',
      -- window_style = "",
      window_border = 'solid',
      window_title = true,
      notes_dir = vim.fn.stdpath 'cache' .. '/flote',
      files = {
        global = 'flote-global.md',
        cwd = function()
          return vim.fn.getcwd()
        end,
        -- file_name = function(cwd)
        --   local base_name = vim.fs.basename(cwd)
        --   local parent_base_name = vim.fs.basename(vim.fs.dirname(cwd))
        --   return parent_base_name .. "_" .. base_name .. ".md"
        -- end,
        files = {
          cwd = function()
            local bufPath = vim.api.nvim_buf_get_name(0)
            local cwd = require('lspconfig').util.root_pattern '.git'(bufPath)

            return cwd
          end,
        },
      },
    }
  end,
}
