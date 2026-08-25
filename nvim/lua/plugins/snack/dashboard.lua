return {
  -- lazy.nvim
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- event = "VeryLazy",
  opts = {
    dashboard = {

      preset = {
        header = table.concat({
          "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣀⣀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "   ⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣄⠀⠀⠀⠀⠀",
          "   ⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀",
          "   ⠀⠀⢀⣶⣿⣿⣿⣿⣿⣿⠍⠉⠀⠀⠀⠀⠉⠉⠛⠿⣿⣿⣿⣿⣿⣦⡀⠀",
          "   ⠀⢠⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢿⣿⣿⣿⣿⠀",
          "   ⢀⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡀",
          "   ⣼⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣷",
          "   ⠸⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿",
          "   ⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿",
          "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡟",
          "   ⠀⠰⣦⣄⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⡿⠀",
          "   ⠀⠀⠙⣿⣷⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⠏⠁⠀",
          "   ⠀⠀⠀⠀⠙⢿⣿⣿⣶⣤⣀⡀⠀⠀⠀⣀⣠⣤⣶⣿⣿⣿⣿⡿⠃⠀⠀⠀",
          "   ⠀⠀⠀⠀⠀⠀⠘⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⠀⠀⠀⠀⠀",
          "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠙⠛⠋⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "   ███████╗ ███████╗███╗   ██╗ ",
          "   ╚══███╔╝ ██╔════╝████╗  ██║ ",
          "     ███╔╝  █████╗  ██╔██╗ ██║ ",
          "    ███╔╝   ██╔══╝  ██║╚██╗██║ ",
          "   ████████╗███████╗██║ ╚████║ ",
          "   ╚═══════╝╚══════╝╚═╝  ╚═══╝ ",
          "",
        }, "\n"),
        -- These keys are rendered by the `keys` section below
        keys = {
          { icon = "󰙰", key = "r", desc = "Restore Session", action = ':lua require("persistence").load()' },
          { icon = "", key = "c", desc = "leetocde", action = ':Leet' },
          { icon = " ", key = "s", desc = "Select Session",  action = ':lua require("persistence").select()' },
          { icon = " ", key = "l", desc = "Latest Session",  action = ':lua require("persistence").load({last = true})' },
          { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
        },
      },

      sections = {
        { section = "header" },
        { section = "keys", pane = 1, gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return require("snacks").git.get_root() ~= nil
          end,
          cmd = "git --no-pager diff --stat -B -M -C",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup", pane = 1 },
      },
    },
  },
}
