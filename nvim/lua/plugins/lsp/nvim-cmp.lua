
return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  -- event = { 'InsertEnter' },
  dependencies = {

    -- engine
    { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },

    {
      'folke/lazydev.nvim',
      opts = {},
    },
    -- source
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-cmdline',

    -- copilot

    -- database
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },

    -- debug
    'rcarriga/cmp-dap',

    -- go
    -- { 'Snikimonkd/cmp-go-pkgs', ft = 'go' }, -- for go

    -- graphql
    -- 'mistweaverco/kulala-cmp-graphql.nvim',

    -- env
    'SergioRibera/cmp-dotenv',
  },

  config = function()
    local function has_words_before()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end
    local luasnip = require 'luasnip'
    local cmp = require 'cmp'

    vim.keymap.set('n', '<leader>cmpinfo', '<cmd>lua print(vim.inspect(require("cmp").get_config().sources))<CR>', { noremap = true, silent = true })

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
      Copilot = '',
      go_pkgs = '',
      -- go_pkgs = '',
    }
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {
      window = {
        ---@type function | table
        completion = cmp.config.window.bordered(),
        ---@type function | table
        documentation = cmp.config.window.bordered(),
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.order,
        },
      },

      completion = {
        completeopt = 'menu,menuone,preview',
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          elseif cmp.visible() then
            -- if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
          elseif luasnip.expandable() then
            luasnip.expand()
            -- elseif has_words_before() then
            -- cmp.complete()
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),

        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-f>'] = cmp.mapping.confirm { select = true },
      },

      sources = cmp.config.sources {
        { name = 'nvim_lsp', priority = 50, group_index = 1 },
        { name = 'luasnip', priority = 100, group_index = 1 },
        { name = 'buffer', priority = 180, group_index = 4 },
        { name = 'path', group_index = 5 },
        -- { name = 'vim-dadbod-completion' },
        -- { name = 'copilot', priority = 300, group_index = 1 },
        -- { name = 'dap', priority = 40, group_index = 6 },
        { name = 'go_pkgs' },
        name = 'lazydev',
      },

      -- cmp.setup.filetype("http", {
      --   sources = cmp.config.sources({
      --     { name = "kulala-cmp-graphql" },
      --   }, {
      --     { name = "buffer" },
      --   }),
      -- }),

      formatting = {

        expandable_indicator = true,
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, item)
          item.menu = item.kind
          -- item = require('cmp-tailwind-colors').format(entry, item)
          item = require('nvim-highlight-colors').format(entry, item)
          if kind_icons[item.kind] then
            item.kind = kind_icons[item.kind]
          end
          return item
        end,
      },

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      }),
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
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
