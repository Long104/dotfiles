return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    {
      'L3MON4D3/LuaSnip',
      -- follow latest release. version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release) install jsregexp (optional!). build = "make install_jsregexp",
    },
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'rafamadriz/friendly-snippets', -- useful snippets
    'onsails/lspkind.nvim', -- vs-code like pictograms
    'hrsh7th/cmp-cmdline',
  },
  config = function()
    local cmp = require 'cmp'
    local WIDE_HEIGHT = 40

    local luasnip = require 'luasnip'

    local lspkind = require 'lspkind'

    local function has_words_before()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {

      window = {
        completion = {
          border = { '', '', '', '', '', '', '', '' },
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
          winblend = vim.o.pumblend,
          scrolloff = 0,
          col_offset = 0,
          side_padding = 1,
          scrollbar = true,
        },
        documentation = {
          max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
          max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
          border = { '', '', '', ' ', '', '', '', ' ' },
          winhighlight = 'FloatBorder:NormalFloat',
          winblend = vim.o.pumblend,
        },
      },

      sorting = {
        priority_weight = 2,
        comparators = {
          require('copilot_cmp.comparators').prioritize,

          -- Below is the default comparitor list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {

        ['<Tab>'] = cmp.mapping(function(fallback)
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          elseif cmp.visible() then
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
        --

        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm { select = false },
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'luasnip', group_index = 2 }, -- snippets
        { name = 'buffer', group_index = 2 }, -- text within current buffer
        { name = 'path', group_index = 2 }, -- file system paths
        { name = 'copilot', group_index = 3 }, -- copilot suggestions
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Copilot = '' },
          expandable_indicator = '',
          fields = {},
        },
      },
    }

    -- `/` cmdline setup.
    -- cmp.setup.cmdline('/', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = 'buffer' }
    --   }
    -- })

    -- `:` cmdline setup.
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = 'path' }
    --   }, {
    --     {
    --       name = 'cmdline',
    --       option = {
    --         ignore_cmds = { 'Man', '!' }
    --       }
    --     }
    --   })
    -- })
  end,
}
