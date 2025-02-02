return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  -- lazy=true,
  keys = {
    {
      mode = 'n',
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Add current file to harpoon',
    },
    {
      mode = 'n',
      '<leader>hm',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = 'Toggle Harpoon Menu',
    },
    {
      mode = 'n',
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Select Harpoon 1',
    },
    {
      mode = 'n',
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Select Harpoon 2',
    },
    {
      mode = 'n',
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Select Harpoon 3',
    },

    {
      mode = 'n',
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Select Harpoon 4',
    },
    {
      mode = 'n',
      '<leader>5',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'Select Harpoon 5',
    },
    {
      mode = 'n',
      '<leader>6',
      function()
        require('harpoon'):list():select(6)
      end,
      desc = 'Select Harpoon 6',
    },
    {
      mode = 'n',
      '<leader>7',
      function()
        require('harpoon'):list():select(7)
      end,
      desc = 'Select Harpoon 7',
    },
    {
      mode = 'n',
      '<leader>8',
      function()
        require('harpoon'):list():select(8)
      end,
      desc = 'Select Harpoon 8',
    },
    {
      mode = 'n',
      '<leader>9',
      function()
        require('harpoon'):list():select(9)
      end,
      desc = 'Select Harpoon 9',
    },
    {
      mode = 'n',
      '<leader>a1',
      function()
        require('harpoon'):list():replace_at(1)
      end,
      desc = 'replace to Harpoon 1',
    },
    {
      mode = 'n',
      '<leader>a2',
      function()
        require('harpoon'):list():replace_at(2)
      end,
      desc = 'replace to Harpoon 2',
    },
    {
      mode = 'n',
      '<leader>a3',
      function()
        require('harpoon'):list():replace_at(3)
      end,
      desc = 'replace to Harpoon 3',
    },
    {
      mode = 'n',
      '<leader>a4',
      function()
        require('harpoon'):list():replace_at(4)
      end,
      desc = 'replace to Harpoon 4',
    },
    {
      mode = 'n',
      '<leader>a5',
      function()
        require('harpoon'):list():replace_at(5)
      end,
      desc = 'replace to Harpoon 5',
    },
    {
      mode = 'n',
      '<leader>a6',
      function()
        require('harpoon'):list():replace_at(6)
      end,
      desc = 'replace to Harpoon 6',
    },
    {
      mode = 'n',
      '<leader>a7',
      function()
        require('harpoon'):list():replace_at(7)
      end,
      desc = 'replace to Harpoon 7',
    },
    {
      mode = 'n',
      '<leader>a8',
      function()
        require('harpoon'):list():replace_at(8)
      end,
      desc = 'replace to Harpoon 8',
    },
    {
      mode = 'n',
      '<leader>a9',
      function()
        require('harpoon'):list():replace_at(9)
      end,
      desc = 'replace to Harpoon 9',
    },

    {
      mode = 'n',
      '<leader>hd',
      function()
        require('harpoon'):list():remove()
      end,
      desc = 'Harpoon delete',
    },

    {
      mode = 'n',
      '<leader>hp',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'previous Harpoon ',
    },

    {
      mode = 'n',
      '<leader>hn',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'next harpoon',
    },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Toggle previous & next buffers stored within Harpoon list

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
