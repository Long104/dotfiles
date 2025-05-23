return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git", -- also try out "git_branch"
    icons = false, -- setting to "true" requires "nvim-web-devicons"
    status = false,
  },
  keys = {
    { "<CR>", false, normap = true },
    { mode = "n", "<S-p>", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    -- { "<C-r>", "<cmd>Grapple reset<cr>", desc = "reset" },
    { "<C-p>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
    { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
    { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Select fourth tag" },
    { "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Select fourth tag" },
    { "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Select fourth tag" },
    { "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Select fourth tag" },
    { "<leader>9", "<cmd>Grapple select index=9<cr>", desc = "Select fourth tag" },

    -- { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
    -- { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
  },
  -- config = function ()
  -- require("telescope").load_extension("grapple")

  -- vim.keymap.set("n", "<c-g>", "<cmd>Telescope grapple tags<cr>",{ desc = "Toggle tags menu" })
  -- end
}
