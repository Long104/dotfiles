return {
  "nvzone/typr",
  cmd = { "TyprStats", "Typr" },
  keys = {
    { mode = "n", "<leader>Ty", ":Typr<CR>" },
    { mode = "n", "<leader>Ts", ":TyprStats<CR>" },
  },
  dependencies = {
    { "nvzone/volt" },
  },
  opts = {
    winlayout = "responsive",
    kblayout = "qwerty",
    wpm_goal = 120,
    numbers = false,
    symbols = false,
    random = false,
    insert_on_start = false,
    stats_filepath = vim.fn.stdpath "config" .. "/typrstats",
    mappings = nil,
    -- or function(buf)   end
    -- mappings = function(buf)
    --  vim.keymap.set("n", "a, anything, { buffer = buf })
    -- end
  },
}
