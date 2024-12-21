return {
  {
    'yetone/avante.nvim',
    keys = { {
      mode = { 'x', 'n' },
      '<leader>aa',
      '<cmd>AvanteAsk<cr>',
    } },
    cmd = { 'AvanteAsk' },
    -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    -- event = 'VeryLazy',
    -- lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = { -- add any opts here
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      -- provider = 'copilot', -- Recommend using Claude
      -- auto_suggestions_provider = 'copilot', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      provider = 'gemini', -- Recommend using Claude
      auto_suggestions_provider = 'gemini', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      -- provider = 'openai', -- Recommend using Claude
      -- auto_suggestions_provider = 'openai', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      -- openai = {
      --   -- endpoint = 'https://api.anthropic.com',
      --   model = 'openai/gpt-3',
      --   temperature = 0,
      --   max_tokens = 4096,
      -- },
      gemini = {
        api_key_name = os.getenv 'GEMINI_API_KEY',
        endpoint = 'aiplatform.googleapis.com',
        temperature = 0,
        max_tokens = 4096,
        -- generationConfig = {
        --   stopSequences = { 'test' },
        -- },
        -- model = 'Gemini-1.0-Pro',
      },
      -- claude = {
      --   endpoint = 'https://api.anthropic.com',
      --   model = 'claude-3-5-sonnet-20240620',
      --   temperature = 0,
      --   max_tokens = 4096,
      -- },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = 'co',
          theirs = 'ct',
          all_theirs = 'ca',
          both = 'cb',
          cursor = 'cc',
          next = ']x',
          prev = '[x',
        },
        suggestion = {
          accept = '<M-l>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
        jump = {
          next = ']]',
          prev = '[[',
        },
        submit = {
          normal = '<CR>',
          insert = '<C-s>',
        },
      },
      hints = { enabled = true },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = 'right', -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          align = 'center', -- left, center, right for title
          rounded = true,
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = 'DiffText',
          incoming = 'DiffAdd',
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = 'copen',
      },

      -- width
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      -- {
      --   -- support for image pasting
      --   'HakonHarnes/img-clip.nvim',
      --   event = 'VeryLazy',
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
      -- {
      --   -- Make sure to set this up properly if you have lazy=true
      --   'MeanderingProgrammer/render-markdown.nvim',
      --   opts = {
      --     file_types = { 'markdown', 'Avante' },
      --   },
      --   ft = { 'markdown', 'Avante' },
      -- },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      dependencies = {
        -- Manage libuv types with lazy. Plugin will never be loaded
        { 'Bilal2453/luvit-meta', lazy = true },
      },
      library = {
        { path = '~/workspace/avante.nvim/lua', words = { 'avante' } },
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
}
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "ToggleMyPrompt"
--   callback = function() require("avante.config").override({system_prompt = "MY CUSTOM SYSTEM PROMPT"}) end,
-- })
--
-- vim.keymap.set("n", "<leader>am", function() vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" }) end, { desc = "avante: toggle my prompt" })

-- Key Bindings
-- The following key bindings are available for use with avante.nvim:
--
-- Key Binding	Description
-- Leaderaa	show sidebar
-- Leaderar	refresh sidebar
-- Leaderae	edit selected blocks
-- co	choose ours
-- ct	choose theirs
-- ca	choose all theirs
-- c0	choose none
-- cb	choose both
-- cc	choose cursor
-- ]x	move to previous conflict
-- [x	move to next conflict
-- [[	jump to previous codeblocks (results window)
-- ]]	jump to next codeblocks (results windows)
