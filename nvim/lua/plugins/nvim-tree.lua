return {
  "nvim-tree/nvim-tree.lua",
  -- dependencies = { {
  -- 'nvim-tree/nvim-web-devicons',opts = {
  -- http = {
  --    icon = "🌐",    -- Example icon (use any emoji or custom icon)
  --    color = "#519aba",  -- Choose a hex color for the icon
  --    cterm_color = "67",
  --    name = "http"
  --  }
  -- }
  -- } },
  keys = {
    -- { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'toggle file explorer' }, -- toggle file explorer
    {

      "<leader>e",
      function()
        require("nvim-tree.api").tree.toggle { path = "CWD", find_file = false, update_root = false, focus = true }
      end,
      desc = "toggle file explorer",
    }, -- toggle file explorer
    {
      "<leader>ef",
      ":NvimTreeRefresh<CR>",
      desc = "refrest nvim tree",
    },
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  config = function()
    -- opts = {
    local nvimtree = require "nvim-tree"

    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#808080", bg = "none" })
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwplugin = 1

    nvimtree.setup {
      sync_root_with_cwd = true,
      hijack_cursor = true,
      disable_netrw = true,

      -- floating center
      -- view = {
      --   relativenumber = true,
      --   float = {
      --     enable = true,
      --     open_win_config = function()
      --       local screen_w = vim.opt.columns:get()
      --       local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
      --       local window_w = screen_w * WIDTH_RATIO
      --       local window_h = screen_h * HEIGHT_RATIO
      --       local window_w_int = math.floor(window_w)
      --       local window_h_int = math.floor(window_h)
      --       local center_x = (screen_w - window_w) / 2
      --       local center_y = ((vim.opt.lines:get() - window_h) / 2)
      --                        - vim.opt.cmdheight:get()
      --       return {
      --         border = "rounded",
      --         relative = "editor",
      --         row = center_y,
      --         col = center_x,
      --         width = window_w_int,
      --         height = window_h_int,
      --       }
      --       end,
      --   },
      --   width = function()
      --     return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
      --   end,
      -- },

      -- comment this if you want float
      view = {
        -- signcolumn = "no",
        -- cursorline = false,
        width = 31,
        -- relativenumber = true,
        -- number = true,
      },

      --
      update_focused_file = {
        enable = true,
        update_cwd = true,
        -- update_root = false,
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
        -- root_folder_label = ':~:s?$?/..?',
        -- root_folder_label = false,
        root_folder_label = ":~:s?$?/..?",
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
            git = { unmerged = "" },
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
        custom = { ".ds_store" },
      },
      git = {
        ignore = false,
      },
    }
  end,
}
