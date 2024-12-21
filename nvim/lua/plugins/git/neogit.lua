-- This contains mainly Neogit but also a bunch of Git settings
-- like fetching branches with telescope or blaming with fugitive
return {
  "NeogitOrg/neogit",
  keys = {
    {
      mode = "n",
      "<leader>gcl",
      ":NeogitLogCurrent<CR>",
      desc = "Neogit Log",
    },
    {
      mode = "n",
      "<leader>gs",
      function()
        require("neogit").open()
      end,
      desc = "Neogit Status",
    },
    {
      mode = "n",
      "<leader>gc",
      ":Neogit commit<CR>",
      desc = "Neogit Commit",
    },
    {
      mode = "n",
      "<leader>gp",
      ":Neogit pull<CR>",
      desc = "Neogit Pull",
    },
    {
      mode = "n",
      "<leader>gP",
      ":Neogit push<CR>",
      desc = "Neogit Push",
    },
    {
      mode = "n",
      "<leader>gb",
      ":Telescope git_branches<CR>",
      desc = "Telescope Git Branches",
    },
    {
      mode = "n",
      "<leader>gB",
      ":G blame<CR>",
      desc = "Git Blame",
    },
  },

  config = function()
    local neogit = require "neogit"
    neogit.setup {}

    -- vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
    --
    -- vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })
    --
    -- vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true })
    --
    -- vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true })
    --
    -- vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
    --
    -- vim.keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true })
  end,
}
