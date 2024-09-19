return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },

  ft = { 'markdown', 'Avante' },
  -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  -- Moved highlight creation out of opts as suggested by plugin maintainer
  -- There was no issue, but it was creating unnecessary noise when ran
  -- :checkhealth render-markdown https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/138#issuecomment-2295422741
  init = function()
    -- Define color variables
    -- These are the colors for the eldritch colorscheme
    -- local color1_bg = '#f265b5'
    -- local color2_bg = '#37f499'
    -- local color3_bg = '#04d1f9'
    -- local color4_bg = '#a48cf2'
    -- local color5_bg = '#f1fc79'
    -- local color6_bg = '#f7c67f'
    -- local color_fg = '#323449'
    -- local color_sign = "#ebfafa"

    local color1_bg = '#c76b98'
    local color2_bg = '#8feadd'
    local color3_bg = '#6798b0'
    local color4_bg = '#947394'
    local color5_bg = '#f6e2ba'
    local color6_bg = '#f7c67f'
    local color_fg = '#323449'

    -- Heading colors (when not hovered over), extends through the entire line
    vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
    vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
    vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
    vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
    vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
    vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg))

    -- Highlight for the heading and sign icons (symbol on the left)
    -- I have the sign disabled for now, so this makes no effect
    vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
    vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
    vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
    vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
    vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
    vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))
    vim.cmd(string.format([[highlight RenderMarkdownDash cterm=bold gui=bold guifg=%s]], color6_bg))
    vim.cmd(string.format([[highlight RenderMarkdownBullet cterm=bold gui=bold guifg=%s]], color6_bg))
  end,
  opts = {
    file_types = { 'markdown', 'quatro', 'vimwiki', 'Avante' },

    -- anti_conceal = { enabled = false },
    render_modes = { 'n', 'v', 'V', 'i', 'c' },
    -- default
    -- render_modes = { 'n', 'c' }
    heading = {
      -- border = true,
      sign = true,
      -- icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
      icons = {
        '󰼏 ',
        '󰎨 ',
        '󰼑 ',
        '󰎲 ',
        '󰼓 ',
        '󰎴 ',
      },
      -- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      signs = { '󰫎 ' },
      -- position = 'inline',
      position = 'overlay',
      -- left_pad = 0,
      -- right_pad = 0,
      -- min_width = 30,
      -- width = 'block',
      -- left_pad = 2,
      right_pad = 2,

      -- for nord
      backgrounds = {
        'Headline1',
        'Headline2',
        'Headline3',
        'Headline4',
        'Headline5',
        'Headline6',
      },
      foregrounds = {
        'Headline1',
        'Headline2',
        'Headline3',
        'Headline4',
        'Headline5',
        'Headline6',
      },

      -- backgrounds = {
      --   'Headline1Bg',
      --   'Headline2Bg',
      --   'Headline3Bg',
      --   'Headline4Bg',
      --   'Headline5Bg',
      --   'Headline6Bg',
      -- },
      -- foregrounds = {
      --   'Headline1Fg',
      --   'Headline2Fg',
      --   'Headline3Fg',
      --   'Headline4Fg',
      --   'Headline5Fg',
      --   'Headline6Fg',
      -- },
    },
    dash = {
      -- Turn on / off thematic break rendering
      enabled = true,
      -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
      -- The icon gets repeated across the window's width
      icon = '',

      -- Width of the generated line:
      --  <integer>: a hard coded width value
      --  full:      full width of the window
      width = 'full',
      -- Highlight for the whole line generated from the icon
      -- highlight = 'RenderMarkdownDash',
      highlight = 'RenderMarkdownDash',
    },
    bullet = {
      enabled = true,
      icons = { '●', '○', '◆', '◇' },
      left_pad = 1,
      right_pad = 0,
      highlight = 'RenderMarkdownBullet',
    },
    checkbox = {
      enabled = true,
      position = 'inline',
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
      },
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
        book = { raw = '[~]', rendered = '󰓎 ', highlight = 'DiagnosticWarn' },
      },
    },
    pipe_table = {
      enabled = true,
      -- preset = 'heavy',
      preset = 'round',
      style = 'full',
      -- style = 'full',
      cell = 'padded',
      alignment_indicator = '━',
      border = {
        '┌',
        '┬',
        '┐',
        '├',
        '┼',
        '┤',
        '└',
        '┴',
        '┘',
        '│',
        '─',
      },
      head = 'RenderMarkdownTableHead',
      row = 'RenderMarkdownTableRow',
      filler = 'RenderMarkdownTableFill',
    },
    callout = {
      note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
      tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
      important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
      warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
      caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
      abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
      todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
      success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
      question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
      failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
      danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
      bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
      example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
      quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
    },
    link = {
      enabled = true,
      image = '󰥶 ',
      email = '󰀓 ',
      hyperlink = '󰌹 ',
      highlight = 'RenderMarkdownLink',
      custom = {
        web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
      },
    },
    indent = {
      enabled = false,
      per_level = 2,
    },
    sign = {
      enabled = true,
      highlight = 'RenderMarkdownSign',
    },
  },
}
