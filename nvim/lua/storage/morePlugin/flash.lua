return {
  "folke/flash.nvim",
  -- stylua: ignore
  keys = {
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "sr", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "sl", mode = {"o","n",'x'}, function() require("flash").remote() end, desc = "Remote Flash" },
    { "sR", mode = { "o", "x","n" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  ---@type Flash.Config
  opts = {},
}
