-- return {
--   'lukas-reineke/indent-blankline.nvim',
--   event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
--   main = 'ibl',
--   -- ---@module "ibl"
--   -- ---@type ibl.config
--   config = function()
--     require('ibl').overwrite {
--       exclude = { filetypes = { 'dashboard', 'alpha' } },
--     }
--
--     local highlight = {
--       'RainbowRed',
--       'RainbowYellow',
--       'RainbowBlue',
--       'RainbowOrange',
--       'RainbowGreen',
--       'RainbowViolet',
--       'RainbowCyan',
--     }
--     local hooks = require 'ibl.hooks'
--     -- create the highlight groups in the highlight setup hook, so they are reset
--     -- every time the colorscheme changes
--     hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--       vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
--       vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
--       vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
--       vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
--       vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
--       vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
--       vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
--     end)
--
--     vim.g.rainbow_delimiters = { highlight = highlight }
--     require('ibl').setup { scope = { highlight = highlight } }
--
--     hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
--   end,
-- }

return {
  'echasnovski/mini.indentscope',
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    require('mini.indentscope').setup {
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 100,

        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        animation = function()
          return 25
        end,

        -- Symbol priority. Increase to display on top of more symbols.
        priority = 2,
      },
      mappings = {
        -- Textobjects
        object_scope = 'ii',
        object_scope_with_border = 'ai',

        -- Motions (jump to respective border line; if not present - body line)
        goto_top = '[i',
        goto_bottom = ']i',
      },

      options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = 'both',

        -- Whether to use cursor column when computing reference indent.
        -- Useful to see incremental scopes with horizontal cursor movements.
        indent_at_cursor = true,

        -- Whether to first check input line to be a border of adjacent scope.
        -- Use it if you want to place cursor on function header to get scope of
        -- its body.
        -- try_as_border = false,
        try_as_border = true,
      },

      -- Which character to use for drawing scope indicator
      -- symbol = '╎',
      symbol = '▏',
      -- symbol = "│",
      init = function()
        vim.api.nvim_create_autocmd('FileType', {
          pattern = {
            'alpha',
            'dashboard',
            'fzf',
            'help',
            'lazy',
            'lazyterm',
            'mason',
            'neo-tree',
            'notify',
            'toggleterm',
            'Trouble',
            'trouble',
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })
      end,
    }
  end,
}
