return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  -- lazy=true,
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end)
    vim.keymap.set('n', '<leader>6', function()
      harpoon:list():select(6)
    end)
    vim.keymap.set('n', '<leader>7', function()
      harpoon:list():select(7)
    end)
    vim.keymap.set('n', '<leader>8', function()
      harpoon:list():select(8)
    end)
    vim.keymap.set('n', '<leader>9', function()
      harpoon:list():select(9)
    end)
    --

    vim.keymap.set('n', '<leader>a1', function()
      harpoon:list():replace_at(1)
    end)
    vim.keymap.set('n', '<leader>a2', function()
      harpoon:list():replace_at(2)
    end)
    vim.keymap.set('n', '<leader>a3', function()
      harpoon:list():replace_at(3)
    end)
    vim.keymap.set('n', '<leader>a4', function()
      harpoon:list():replace_at(4)
    end)
    vim.keymap.set('n', '<leader>a5', function()
      harpoon:list():replace_at(5)
    end)
    vim.keymap.set('n', '<leader>a6', function()
      harpoon:list():replace_at(6)
    end)
    vim.keymap.set('n', '<leader>a7', function()
      harpoon:list():replace_at(7)
    end)
    vim.keymap.set('n', '<leader>a8', function()
      harpoon:list():replace_at(8)
    end)
    vim.keymap.set('n', '<leader>a9', function()
      harpoon:list():replace_at(9)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hd', function()
      harpoon:list():remove()
    end)
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end)

    -- basic telescope configuration

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>fh', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
