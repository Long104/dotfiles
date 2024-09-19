return {
  {
    'nvim-lua/popup.nvim',
  },
  {
    'nvim-lua/plenary.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    config = function()
      require('telescope').load_extension 'media_files'
      require('telescope').setup {
        extensions = {
          media_files = {
            -- Filetypes whitelist
            filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
            -- Find command (defaults to `fd`)
            find_cmd = 'rg',
          },
        },
      }

      -- Using the Telescope media files extension in Lua
      vim.keymap.set('n', '<leader>mf', ':lua require("telescope").extensions.media_files.media_files()<CR>', { noremap = true, silent = true })
    end,
  },
}
