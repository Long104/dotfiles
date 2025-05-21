return {
  "leath-dub/snipe.nvim",
  keys = {
    {
      "sl",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open Snipe buffer menu",
    },
  },
  opts = {
    ui = {
      -- max_width = -1, -- -1 means dynamic width
      max_width = -1, -- -1 means dynamic width
      -- Where to place the ui window
      -- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
      position = "cursor",

      open_win_override = {
        -- title = "My Window Title",
        border = "rounded", -- use "rounded" for rounded border
      },
    },
    hints = {
      -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
      dictionary = "asdfjkl;",
    },
    navigate = {
      -- When the list is too long it is split into pages
      -- `[next|prev]_page` options allow you to navigate
      -- this list
      next_page = "J",
      prev_page = "K",

      -- You can also just use normal navigation to go to the item you want
      -- this option just sets the keybind for selecting the item under the
      -- cursor
      under_cursor = "<cr>",
      cancel_snipe = { "<esc>", "q" },
      close_buffer = "D",

      -- Open buffer in vertical split
      open_vsplit = "V",

      -- Open buffer in split, based on `vim.opt.splitbelow`
      open_split = "H",

      -- Change tag manually
      change_tag = "C",
    },
    sort = "default",
  },
}

-- vim.keymap.set('n', '<leader>gg', function()
--   local toggle = require('snipe').create_buffer_menu_toggler {
--     -- Limit the width of path buffer names
--     max_path_width = 1,
--   }
--   toggle()
-- end, { desc = '[P]Snipe' })
--
