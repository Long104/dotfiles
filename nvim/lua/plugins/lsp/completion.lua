return {
  "saghen/blink.cmp",
  event = "VeryLazy",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    { "mikavilpas/blink-ripgrep.nvim", version = "*" },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets" } }

          local extends = {
            typescript = { "tsdoc" },
            javascript = { "jsdoc" },
            lua = { "luadoc" },
            python = { "pydoc" },
            rust = { "rustdoc" },
            cs = { "csharpdoc" },
            java = { "javadoc" },
            c = { "cdoc" },
            cpp = { "cppdoc" },
            php = { "phpdoc" },
            kotlin = { "kdoc" },
            ruby = { "rdoc" },
            sh = { "shelldoc" },
          }
          -- friendly-snippets - enable standardized comments snippets
          for ft, snips in pairs(extends) do
            require("luasnip").filetype_extend(ft, snips)
          end
        end,
      },
      opts = { history = true, delete_check_events = "TextChanged" },
    },
  },
  version = "1.*",
  build = "cargo build --release",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      -- control whether the next command will be run when using a function
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-y>"] = { "select_and_accept", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      ["<C-u>"] = { "scroll_signature_up", "fallback" },
      ["<C-d>"] = { "scroll_signature_down", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      -- full - prefix
      keyword = { range = "prefix" },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      accept = { auto_brackets = { enabled = true } },
      ghost_text = { enabled = true },
      list = { selection = { preselect = false, auto_insert = false } },

      menu = {
        -- Don't automatically show the completion menu
        auto_show = true,
        -- nvim-cmp style menu
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
    },

    -- snippets = { preset = "default" | "luasnip" | "mini_snippets" | "vsnip" },
    snippets = {
      preset = "luasnip",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        "lazydev",
        "copilot",
        "lsp",
        "path",
        "snippets",
        "buffer",
        "ripgrep",
      },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {
            prefix_min_len = 4,
            score_offset = 10, -- should be lower priority
            max_filesize = "300K",
            search_casing = "--smart-case",
            project_root_marker = ".git",
            backend = { use = "gitgrep-or-ripgrep" },
          },
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    signature = { enabled = true },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    cmdline = {
      keymap = {
        -- preset = "inherit"
        ["<Tab>"] = { "show_and_insert_or_accept_single", "select_next" },
        ["<S-Tab>"] = { "show_and_insert_or_accept_single", "select_prev" },

        ["<C-space>"] = { "show", "fallback" },

        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<Right>"] = { "select_next", "fallback" },
        ["<Left>"] = { "select_prev", "fallback" },

        ["<C-y>"] = { "select_and_accept", "fallback" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
      },
      completion = { menu = { auto_show = true }, ghost_text = { enabled = true } },
    },

    -- term = {
    --   enabled = true,
    --   keymap = { preset = "inherit" }, -- Inherits from top level `keymap` config when not set
    --   sources = {},
    --   completion = {
    --     trigger = {
    --       show_on_blocked_trigger_characters = {},
    --       show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
    --     },
    --     -- Inherits from top level config options when not set
    --     list = {
    --       selection = {
    --         -- When `true`, will automatically select the first item in the completion list
    --         preselect = nil,
    --         -- When `true`, inserts the completion item automatically when selecting it
    --         auto_insert = nil,
    --       },
    --     },
    --     -- Whether to automatically show the window when new completion items are available
    --     menu = { auto_show = nil },
    --     -- Displays a preview of the selected item on the current line
    --     ghost_text = { enabled = nil },
    --   },
    -- },
  },
  opts_extend = { "sources.default" },
}

-- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
-- ['<C-e>'] = { 'hide', 'fallback' },
-- ['<C-y>'] = { 'select_and_accept', 'fallback' },
--
-- ['<Up>'] = { 'select_prev', 'fallback' },
-- ['<Down>'] = { 'select_next', 'fallback' },
-- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
-- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
--
-- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
-- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
--
-- ['<Tab>'] = { 'snippet_forward', 'fallback' },
-- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
--
-- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
