return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwplugin = 1
    nvimtree.setup {

      view = {
        width = 33,
        -- relativenumber = true,
        -- number = true,
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      -- change folder arrow icons

      renderer = {
        --   highlight_clipboard = "name",
        -- highlight_bookmarks = "none",
        indent_markers = {
          enable = true,
        },

        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- arrow when folder is closed
              arrow_open = '', -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            -- enable = false,
            enable = true,
          },
          quit_on_open = false,
        },
        remove_file = {
          close_window = false,
        },
      },
      filters = {
        custom = { '.ds_store' },
      },
      git = {
        ignore = false,
      },
    }

    -- define a function to create a new file with the same name as the entered file
    local function create_new_file_same_name()
      -- get the filename of the currently selected file in the nvim-tree file explorer
      local selected_file = vim.fn.expand '<cword>'

      -- create the new file using the same name as the selected file
      vim.cmd('edit ' .. selected_file)
    end

    -- configure the keymap for the enter key to execute the function
    vim.g.nvim_tree_bindings = {
      -- set up custom keybindings
      -- here, we're defining a keybinding for the enter key
      ['<cr>'] = create_new_file_same_name,
      -- you can define more keybindings if needed for other actions
    }

    -- set keymap.feedkeys".run(14)
    --
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'toggle file explorer' }) -- toggle file explorer
  end,
}
