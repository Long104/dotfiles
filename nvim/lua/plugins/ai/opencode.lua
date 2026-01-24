return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
  },
  keys = {
    {
      mode = { "n", "x" },
      "aia",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      desc = "Ask opencode",
    },
    {
      mode = { "n", "x" },
      "aip",
      function()
        require("opencode").ask("@grapple: ", { submit = true })
      end,
      desc = "Ask opencode",
    },
    {
      mode = { "n", "x" },
      "aib",
      function()
        require("opencode").ask("@: ", { submit = false })
      end,
      desc = "Ask opencode",
    },
    {
      mode = { "n", "x" },
      "aie",
      function()
        require("opencode").select()
      end,
      desc = "Execute opencode action…",
    },
    {
      mode = { "n", "x" },
      "air",
      function()
        return require("opencode").operator "@this "
      end,
      expr = true,
      desc = "Add range to opencode",
    },
    {
      mode = { "n" },
      "ail",
      function()
        return require("opencode").operator "@this " .. "_"
      end,
      expr = true,
      desc = "Add line to opencode",
    },
    {
      mode = { "n", "t" },
      "ait",
      function()
        require("opencode").toggle()
      end,
      desc = "Toggle opencode",
    },
    {
      mode = { "n" },
      "aihu",
      function()
        require("opencode").command "session.half.page.up"
      end,
      desc = "opencode half page up",
    },
    {
      mode = { "n" },
      "aihd",
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
      provider = {
        enabled = "tmux",
        -- enabled = "terminal",
        -- cmd = "opencode",
        -- enabled = "snacks",
        -- snacks = {
        --   split = "right",
        --   width = 55,
        -- },
        -- terminal = {
        --   split = "right",
        --   width = 55,
        -- },
        tmux = {
          split = "right",
          width = 54,
        },
      },
      prompts = {
        ask_append = { prompt = "", ask = true }, -- Handy to insert context mid-prompt. Simpler than exposing every context as a prompt by default.
        ask_this = { prompt = "@this: ", ask = true, submit = true },
        diagnostics = { prompt = "Explain @diagnostics", submit = true },
        diff = { prompt = "Review the following git diff for correctness and readability: @diff", submit = true },
        document = { prompt = "Add comments documenting @this", submit = true },
        explain = { prompt = "Explain @this and its context", submit = true },
        fix = { prompt = "Fix @diagnostics", submit = true },
        implement = { prompt = "Implement @this", submit = true },
        optimize = { prompt = "Optimize @this for performance and readability", submit = true },
        review = { prompt = "Review @this for correctness and readability", submit = true },
        test = { prompt = "Add tests for @this", submit = true },
      },
      ask = {
        prompt = "Ask opencode: ",
        blink_cmp_sources = { "opencode", "buffer" },
        snacks = {
          icon = "󰚩 ",
          win = {
            title_pos = "left",
            relative = "cursor",
            row = -3, -- Row above the cursor
            col = 0, -- Align with the cursor
          },
        },
      },
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
