return {

  'sidebar-nvim/sidebar.nvim',
  dependencies = {
    'ThePrimeagen/harpoon',
  },

  config = function()
    local function get_harpoon_files()
      local harpoon = require 'harpoon'

      local file_list = {}

      for i, mark in ipairs(harpoon.get_mark_config().marks) do
        if mark.filename then
          table.insert(file_list, string.format('%d. %s', i, mark.filename))
        end
      end

      return file_list
    end

    local harpoon_files_section = {

      title = 'Harpooned',

      icon = '',

      draw = function()
        return { lines = get_harpoon_files() }
      end,
    }

    require('sidebar-nvim').setup {

      open = false,

      sections = {

        harpoon_files_section,

        'git',

        'buffers',

        'todos',

        'files',
      },
    }
  end,
}

-- these are the maps I have configured
--
-- --- Harpoon
--
-- keymap("n", "<leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
--
-- keymap("n", "<leader>ar", "<cmd>lua require('harpoon.mark').rm_file()<cr>", opts)
--
-- keymap("n", "<leader>ac", "<cmd>lua require('harpoon.mark').clear_all()<cr>", opts)
--
-- keymap("n", "<leader>a1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
--
-- keymap("n", "<leader>a2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
--
-- keymap("n", "<leader>a3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
--
-- keymap("n", "<leader>a4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
--
-- keymap("n", "<leader>a5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
--
-- keymap("n", "[a", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
--
-- keymap("n", "]a", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
