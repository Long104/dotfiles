return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- lazy = true,
  -- event = 'VeryLazy',
  -- event = 'BufReadPre',
  keys = {
    -- { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'toggle file explorer' }, -- toggle file explorer
    {
      '<leader>e',
      function()
        require('nvim-tree.api').tree.toggle { path = 'CWD', find_file = false, update_root = false, focus = true }
      end,
      desc = 'toggle file explorer',
    }, -- toggle file explorer
  },
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  config = function()
    -- opts = {
    local nvimtree = require 'nvim-tree'

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwplugin = 1
    nvimtree.setup {

      view = {
        -- signcolumn = "no",
        width = 33,
        -- relativenumber = true,
        -- number = true,
      },
      --
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      -- change folder arrow icons
      --

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
    --   local function create_new_file_same_name()
    --     -- get the filename of the currently selected file in the nvim-tree file explorer
    --     local selected_file = vim.fn.expand '<cword>'
    --
    --     -- create the new file using the same name as the selected file
    --     vim.cmd('edit ' .. selected_file)
    --   end
    --
    --   -- configure the keymap for the enter key to execute the function
    --   vim.g.nvim_tree_bindings = {
    --     -- set up custom keybindings
    --     -- here, we're defining a keybinding for the enter key
    --     ['<cr>'] = create_new_file_same_name,
    --     -- you can define more keybindings if needed for other actions
    -- }
  end,
}

-- vim.cmd([[
--     :hi      NvimTreeExecFile    guifg=#ffa0a0
--     :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
--     :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
--     :hi link NvimTreeImageFile   Title
-- ]])
-- let g:NERDTreeStatusline = '%#NonText#'
