return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    {
      mode = { "n", "x" },
      "<C-;>",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      desc = "Ask opencode",
    },
    {
      mode = { "n", "x" },
      "<C-m>",
      function()
        require("opencode").select()
      end,
      desc = "Execute opencode action…",
    },
    {
      mode = { "n", "t" },
      "<C-.>",
      function()
        wharequire("opencode").toggle()
      end,
      desc = "Toggle opencode",
    },
    {
      mode = { "n", "x" },
      "go",
      function()
        return require("opencode").operator "@this "
      end,
      expr = true,
      desc = "Add range to opencode",
    },
    {
      mode = { "n" },
      "goo",
      function()
        return require("opencode").operator "@this " .. "_"
      end,
      expr = true,
      desc = "Add line to opencode",
    },
    {
      mode = { "n" },
      "<S-C-u>",
      function()
        require("opencode").command "session.half.page.up"
      end,
      desc = "opencode half page up",
    },
    {
      mode = { "n" },
      "<S-C-d>",
      function()
        require("opencode").command "session.half.page.down"
      end,
      desc = "opencode half page down",
    },
    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    -- { mode = { "n" }, "+", "<C-a>", desc = "Increment", noremap = true },
    -- { mode = { "n" }, "-", "<C-x>", desc = "Decrement", noremap = true },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      -- provider = {
      --   enabled = "snacks",
      --   snacks = {},
      -- },
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true
  end,
}

-- Name	Prompt
-- diagnostics	Explain @diagnostics
-- diff	Review the following git diff for correctness and readability: @diff
-- document	Add comments documenting @this
-- explain	Explain @this and its context
-- fix	Fix @diagnostics
-- implement	Implement @this
-- optimize	Optimize @this for performance and readability
-- review	Review @this for correctness and readability
-- test	Add tests for @this
