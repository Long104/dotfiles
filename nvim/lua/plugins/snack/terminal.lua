return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>th",
      function()
        require("snacks").terminal (({ vim.o.shell }),{
          win = {
            position = "bottom",
            style = "terminal",
            relative = "editor",
            border = "rounded",
            width = 0.8, -- 80% of editor width
            height = 0.3, -- LOWER HEIGHT: 40% of editor height (try 0.3–0.5)
            row = 0.5,
            col = 0.5,
            wo = {
              winbar = "",
            },
          },
        })
      end,
      desc = "Open terminal",
    },
    {
      "<leader>tf",
      function()
        Snacks.terminal.open({ vim.o.shell }, {
          win = {
            position = "float",
            style = "terminal",
            relative = "editor",
            border = "rounded",
            width = 0.8,
            height = 0.4, -- lower height if you want
            row = 0.5,
            col = 0.5,
          },
        })
      end,
      desc = "Floating terminal",
    },
  },
  opts = {
    terminal = {
      -- win = {
      --   -- position = "float",
      --   style = "terminal",
      --   relative = "editor",
      --   border = "rounded",
      --   width = 0.8, -- 80% of editor width
      --   height = 0.3, -- LOWER HEIGHT: 40% of editor height (try 0.3–0.5)
      --   row = 0.5,
      --   col = 0.5,
      --   wo = {
      --     winbar = "",
      --   }
      -- },
      keys = {
        term_normal = {
          "<esc>",
          function()
            return vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
          end,
          mode = "t",
          expr = true,
          desc = "Single escape to normal mode",
        },
      },
    },
  },
}
