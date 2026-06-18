return {
  -- what is 2 + 2 = 4
  "Long104/claude.nvim",

  keys = {
    {
      mode = { "n" },
      "<leader>cl",
      "<Cmd>ClaudeAsk<cr>",
      desc = "Ask claude",
    },
    {
      mode = { "v" },
      "<leader>cl",
      "<Cmd>ClaudeAskSelection<CR>",
      desc = "Ask claude (selection)",
    },
    {
      mode = { "n" },
      "<leader>cc",
      "<Cmd>ClaudeCancel<CR>",
      desc = "claude cancel",
    },
    {
      mode = { "n" },
      "<leader>cg",
      "<Cmd>ClaudeLog<cr>",
      desc = "claude log",
    },
  },

  config = function()
    require("claude").setup {
      -- model omitted — your settings.json routes sonnet → glm-4.7-flash
      -- Do NOT use system_prompt — it replaces Claude Code's entire built-in
      -- system prompt and breaks tool usage. Use append_system_prompt instead.
      append_system_prompt = "You are a helpful assistant. Always respond concisely.",
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
    }
  end,
}
