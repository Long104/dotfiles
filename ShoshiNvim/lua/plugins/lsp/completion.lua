return {
  'saghen/blink.cmp',
  event = 'VeryLazy',
  dependencies = {
    'xieyonn/blink-cmp-dat-word',
    'archie-judd/blink-cmp-words',
    'rafamadriz/friendly-snippets',
    -- "fang2hou/blink-copilot",
    'ribru17/blink-cmp-spell',
    {
      'Kaiser-Yang/blink-cmp-dictionary',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { 'mikavilpas/blink-ripgrep.nvim', version = '*' },
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
      dependencies = {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snippets' } }

          local extends = {
            typescript = { 'tsdoc' },
            javascript = { 'jsdoc' },
            lua = { 'luadoc' },
            python = { 'pydoc' },
            rust = { 'rustdoc' },
            cs = { 'csharpdoc' },
            java = { 'javadoc' },
            c = { 'cdoc' },
            cpp = { 'cppdoc' },
            php = { 'phpdoc' },
            kotlin = { 'kdoc' },
            ruby = { 'rdoc' },
            sh = { 'shelldoc' },
          }
          -- friendly-snippets - enable standardized comments snippets
          for ft, snips in pairs(extends) do
            require('luasnip').filetype_extend(ft, snips)
          end
        end,
      },
      opts = { history = true, delete_check_events = 'TextChanged' },
    },
  },
  version = '1.*',
  build = 'cargo build --release',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = 'default',

      -- control whether the next command will be run when using a function
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<C-y>'] = { 'select_and_accept', 'fallback' },
      -- ["<CR>"] = { "accept", "fallback" },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
      ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      -- full - prefix
      keyword = { range = 'prefix' },
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
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind' },
          },
        },
      },
    },

    -- snippets = { preset = "default" | "luasnip" | "mini_snippets" | "vsnip" },
    snippets = {
      preset = 'luasnip',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        'datword',
        'spell',
        'dictionary',
        'thesaurus',
        'lsp',
        'path',
        'snippets',
        'buffer',
        'ripgrep',
        'lazydev',
      },
      providers = {
        -- copilot = {
        --   name = "copilot",
        --   module = "blink-copilot",
        --   score_offset = 100,
        --   async = true,
        -- },
        datword = {
          name = 'Word',
          module = 'blink-cmp-dat-word',
          opts = {
            paths = {
              -- "path_to_your_words.txt", -- add your owned word files before dictionary.
              '/usr/share/dict/words', -- This file is included by default on Linux/macOS.
            },
          },
        },
        ripgrep = {
          module = 'blink-ripgrep',
          name = 'Ripgrep',
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {
            prefix_min_len = 4,
            score_offset = 10, -- should be lower priority
            max_filesize = '300K',
            search_casing = '--smart-case',
            project_root_marker = '.git',
            backend = { use = 'gitgrep-or-ripgrep' },
          },
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        spell = {
          name = 'Spell',
          module = 'blink-cmp-spell',
          opts = {
            -- EXAMPLE: Only enable source in `@spell` captures, and disable it
            -- in `@nospell` captures.
            enable_in_context = function()
              local curpos = vim.api.nvim_win_get_cursor(0)
              local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
              local in_spell_capture = false
              for _, cap in ipairs(captures) do
                if cap.capture == 'spell' then
                  in_spell_capture = true
                elseif cap.capture == 'nospell' then
                  return false
                end
              end
              return in_spell_capture
            end,
          },
        },
        thesaurus = {
          name = 'blink-cmp-words',
          module = 'blink-cmp-words.thesaurus',
          -- All available options
          opts = {
            -- A score offset applied to returned items.
            -- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
            score_offset = 0,

            -- Default pointers define the lexical relations listed under each definition,
            -- see Pointer Symbols below.
            -- Default is as below ("antonyms", "similar to" and "also see").
            definition_pointers = { '!', '&', '^' },

            -- The pointers that are considered similar words when using the thesaurus,
            -- see Pointer Symbols below.
            -- Default is as below ("similar to", "also see" }
            similarity_pointers = { '&', '^' },

            -- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
            -- 2 is similar words of similar words, etc. Increasing this may slow results.
            similarity_depth = 2,
          },
        },
        dictionary = {
          name = 'blink-cmp-words',
          module = 'blink-cmp-words.dictionary',
          -- All available options
          opts = {
            -- The number of characters required to trigger completion.
            -- Set this higher if completion is slow, 3 is default.
            dictionary_search_threshold = 3,

            -- See above
            score_offset = 0,

            -- See above
            definition_pointers = { '!', '&', '^' },
          },
        },
        -- dictionary = {
        --   module = 'blink-cmp-dictionary',
        --   name = 'Dict',
        --   -- Make sure this is at least 2.
        --   -- 3 is recommended
        --   min_keyword_length = 3,
        --   opts = {
        --     -- options for blink-cmp-dictionary
        --   },
        -- },
      },
    },

    signature = { enabled = true },

    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      sorts = {
        function(a, b)
          local sort = require 'blink.cmp.fuzzy.sort'
          if a.source_id == 'spell' and b.source_id == 'spell' then
            return sort.label(a, b)
          end
        end,
        -- This is the normal default order, which we fall back to
        'score',
        'kind',
        'label',
      },
    },

    cmdline = {
      keymap = {
        -- preset = "inherit"
        ['<Tab>'] = { 'show_and_insert_or_accept_single', 'select_next' },
        ['<S-Tab>'] = { 'show_and_insert_or_accept_single', 'select_prev' },

        ['<C-space>'] = { 'show', 'fallback' },

        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<Right>'] = { 'select_next', 'fallback' },
        ['<Left>'] = { 'select_prev', 'fallback' },

        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<C-e>'] = { 'cancel', 'fallback' },
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
  opts_extend = { 'sources.default' },
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
