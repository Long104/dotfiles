return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  -- event = { 'InsertEnter', 'CmdlineChanged' },
  -- event = { 'InsertEnter' },
  dependencies = {
    -- lua
    'folke/lazydev.nvim',
    -- { "Bilal2453/luvit-meta", lazy = true } require('lazydev').find_workspace(buf?)
    --
    -- serious
    { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' }, -- engine
    'hrsh7th/cmp-nvim-lsp',
    { 'tzachar/cmp-fuzzy-path', dependencies = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } },
    { 'tzachar/cmp-fuzzy-buffer', dependencies = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } },
    'saadparwaiz1/cmp_luasnip', -- source
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-cmdline',
    -- for markdown
    --
    'f3fora/cmp-spell',
    'octaltree/cmp-look',
    'hrsh7th/cmp-emoji',
    'uga-rosa/cmp-dictionary',
    --
    -- customize
    --
    -- { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },
    -- 'dmitmel/cmp-cmdline-history',
    -- 'David-Kunz/cmp-npm',
    -- { "hrsh7th/cmp-nvim-lua", lazy = true },
    -- 'Snikimonkd/cmp-go-pkgs', -- for go
    -- 'rcarriga/cmp-dap', -- for dap
    -- 'hrsh7th/cmp-omni', -- for css and html linked
    -- 'hrsh7th/cmp-nvim-lsp-signature-help', -- for signature help
    --
    -- no need
    --

    --
    -- {
    --      'tzachar/cmp-tabnine',
    --      build = './install.sh',
    --      dependencies = 'hrsh7th/nvim-cmp',
    --  }
    -- 'onsails/lspkind.nvim', -- vs-code like pictograms
    -- https://github.com/mtoohey31/cmp-fish
    -- 'petertriho/cmp-git',
    -- 'davidsierradz/cmp-conventionalcommits',
    -- 'SergioRibera/cmp-dotenv', -- .env
    { 'hrsh7th/cmp-calc', lazy = true },
    -- { "ray-x/cmp-treesitter", lazy = true },
    --  {     "lukas-reineke/cmp-rg",lazy = true, enabled = function() return vim.fn.executable("rg") == 1 end, },
    'hrsh7th/cmp-nvim-lsp-document-symbol', -- for document symbol
    -- {
    --     "Exafunction/codeium.vim",
    --     lazy = true,
    --     event = "BufEnter",
    --     init = function()
    --       vim.g.codeium_disable_bindings = 1
    --       vim.g.codeium_filetypes = {
    --         TelescopePrompt = false,
    --         NvimTree = false,
    --         dapui_scopes = false,
    --         dapui_breakpoints = false,
    --         dapui_stacks = false,
    --         dapui_repl = false,
    --         dapui_console = false,
    --         dapui_watches = false,
    --         dressing = false,
    --         fugitive = false,
    --         gitcommit = false,
    --         gitrebase = false,
    --         gitsigns = false,
    --         help = false,
    --       }
    --     end,
  },

  config = function()
    local function has_words_before()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end
    -- require('cmp-npm').setup {}
    -- require('cmp_git').setup()
    local luasnip = require 'luasnip'
    local WIDE_HEIGHT = 40
    local cmp = require 'cmp'
    local kind_icons = {
      Text = '',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰂡',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰅲',
      -- Copilot = '',
      go_pkgs = '',
      -- go_pkgs = '',
    }
    require('luasnip.loaders.from_vscode').lazy_load()
    -- require('luasnip.loaders.from_vscode').lazy_load { paths = { '~/.config/xen/snippets/' } }
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
    require('cmp_dictionary').setup {
      paths = { '/usr/share/dict/words' },
      exact_length = 2,
    }

    -- config = function()
    --   local tabnine = require 'cmp_tabnine.config'
    --
    --   tabnine.setup {
    --     max_lines = 1000,
    --     max_num_results = 20,
    --     sort = true,
    --     run_on_every_keystroke = true,
    --     snippet_placeholder = '..',
    --     ignored_file_types = {
    --       -- default is not to ignore
    --       -- uncomment to ignore in lua:
    --       -- lua = true
    --     },
    --     show_prediction_strength = false,
    --     min_percent = 0,
    --   }
    -- end

    cmp.setup {
      -- enabled = function()
      --   return vim.api.nvim_get_option_value('buftype', { buf = 0 }) ~= 'prompt' or require('cmp_dap').is_dap_buffer()
      -- end,
      --
      -- josean
      -- window = {
      --   completion = {
      --     border = { '', '', '', '', '', '', '', '' },
      --     winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
      --     winblend = vim.o.pumblend,
      --     scrolloff = 0,
      --     col_offset = 0,
      --     side_padding = 1,
      --     scrollbar = true,
      --   },
      --   documentation = {
      --     max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
      --     max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      --     border = { '', '', '', ' ', '', '', '', ' ' },
      --     winhighlight = 'FloatBorder:NormalFloat',
      --     winblend = vim.o.pumblend,
      --   },
      -- },

      window = {
        ---@type function | table
        completion = cmp.config.window.bordered(),
        ---@type function | table
        documentation = cmp.config.window.bordered(),
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          require 'cmp_fuzzy_buffer.compare',
          require 'cmp_fuzzy_path.compare',
          -- require('copilot_cmp.comparators').prioritize,
          -- require('cmp_tabnine.compare')
          -- compare.score_offset, -- not good at all
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          -- cmp.config.compare.exact,
          -- cmp.config.compare.kind,
          -- cmp.config.compare.sort_text,
          -- cmp.config.compare.length,
          cmp.config.compare.offset,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.order,
        },
      },
      completion = {
        -- completeopt = 'menu,menuone,preview,noselect',
        completeopt = 'menu,menuone,preview',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert {

        ['<Tab>'] = cmp.mapping(function(fallback)
          -- if require('copilot.suggestion').is_visible() then
          -- require('copilot.suggestion').accept()
          -- elseif cmp.visible() then
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-f>'] = cmp.mapping.confirm { select = false },
        -- ['<CR>'] = cmp.mapping.confirm { select = true },
      },

      sources = cmp.config.sources {
        -- { name = 'vim-dadbod-completion' },
        {
          name = 'look',
          keyword_length = 2,
          priority = 3,
          group_index = 2,
          option = {
            convert_case = true,
            loud = true,
            dict = '/usr/share/dict/words'
          },
        },
        { name = 'dictionary', keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] },
        { name = 'spell', keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] },
        { name = 'fuzzy_path', priority = 4 }, -- from tzacher
        -- { name = "cmp_tabnine", priority = 8 }
        -- { name = 'copilot', priority = 300, group_index = 1 }, -- copilot suggestions
        { name = 'luasnip', priority = 230, group_index = 1 },
        { name = 'nvim_lsp', priority = 150, group_index = 1 },
        { name = 'path', group_index = 5 }, -- file system paths
        { name = 'buffer', priority = 100, group_index = 4 }, -- text within current buffer
        { name = 'fuzzy_buffer', priority = 100, group_index = 4 }, -- text within current buffer
        -- { name = 'dap', priority = 40, group_index = 6 },
        { name = 'calc' },
        -- { name = 'lazydev' },
        -- { name = 'go_pkgs' },
        -- { name = 'npm', keyword_length = 4 },
        -- { name = 'nvim_lsp_signature_help' },
        -- name = 'conventionalcommits' },
        -- {
        --   name = 'omni',
        --   option = {
        --     disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' },
        --   },
        -- },
        { name = 'emoji' },
        { name = 'lazydev' },
      },
      matching = { disallow_symbol_nonprefix_matching = false }, -- to use . and / in urls

      formatting = {
        expandable_indicator = true,
        -- expandable_indicator = '',
        -- symbol_map = { Copilot = '' },
        -- maxwidth = 50, ellipsis_char = '...',
        fields = { 'kind', 'abbr', 'menu' }, -- order of columns,
        -- fields = {},
        format = function(entry, item)
          item.menu = item.kind
          -- item = require('cmp-tailwind-colors').format(entry, item)
          if kind_icons[item.kind] then
            item.kind = kind_icons[item.kind]
          end
          return item
        end,
      },

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'nvim_lsp_document_symbol' },
          { name = 'buffer' },
          { name = 'fuzzy_buffer' },
          -- { name = 'cmdline_history' },
        },
      }),
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          -- { name = 'path' },
          { name = 'fuzzy_path' },
        }, {
          { name = 'cmdline' },
          { name = 'cmdline_history' },
        }),
      }),
      -- cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
      --   sources = {
      --     { name = 'dap' },
      --   },
      -- }),
    }
  end,
}
