return {
    "philosofonusus/ecolog.nvim",
    -- dir = "~/projects/ecolog.nvim",
    keys = {
      { "<leader>fe", "<cmd>Telescope ecolog env<cr>", desc = "Go to env file" },
      { "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
      { "<leader>lS", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
      { "<leader>lt", "<cmd>EcologShelterToggle<cr>", desc = "Ecolog shelter toggle" },
      { "<leader>le", "<cmd>EcologGenerateExample<cr>", desc = "Ecolog shelter toggle" },
    },
    ft = "env",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- lazy = false,
    opts = {
      preferred_environment = "local",
      types = true,
      integrations = {
        lsp = true,
        nvim_cmp = true,
      },
      shelter = {
        configuration = {
          partial_mode = {
            min_mask = 5,
            show_start = 1,
            show_end = 1,
          },
          mask_char = "*",
        },
        modules = {
          files = true,
          peek = false,
          telescope_previewer = true,
          telescope = false,
          cmp = true,
        },
      },
      path = vim.fn.getcwd(),
    },
}
