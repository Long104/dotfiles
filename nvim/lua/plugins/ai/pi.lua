return {
  "pablopunk/pi.nvim",
  keys = {
    {
      mode = { "n" },
      "pi",
      "<Cmd>PiAsk<cr>",
      desc = "pi ask",
    },
    {
      mode = { "v" },
      "pi",
      "<Cmd>PiAskSelection<CR>",
      desc = "Ask pi (selection)",
    },
    {
      mode = { "n" },
      "<leader>pic",
      "<Cmd>PiCancel<CR>",
      desc = "pi cancel",
    },
    {
      mode = { "n" },
      "<leader>pil",
      "<Cmd>PiLog<cr>",
      desc = "pi log",
    },
  },
  config = function()
    require("pi").setup {
      binary = "/opt/homebrew/bin/pi", -- or { "env", "FOO=1", "pi-wrapper" }
      -- provider = "openrouter",
      -- model = "openrouter/free",
      provider = "zai",
      model = "glm-5-turbo",
      thinking = "off", -- be careful, thinking is time-consuming, it's not a great experience if you want simplicity
      system_prompt = "You are a helpful assistant.",
      append_system_prompt = "Always respond concisely.",
      context = {
        max_bytes = 24000,
        ask = {
          surrounding_lines = 80,
        },
        selection = {
          surrounding_lines = 40,
        },
        diagnostics = {
          enabled = false,
        },
      },
      skills = true,
      extensions = true,
    }
  end,
}
