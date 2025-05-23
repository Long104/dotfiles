return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  keys = {
    -- {
    --   mode = 'n',
    --   'goi',
    --   '<cmd>GoIfErr<CR>',
    --   desc = 'go if err',
    -- },
    {
      mode = 'n',
      'goj',
      '<cmd>GoTagAdd json<CR>',
      desc = 'go tag json',
    },
    {
      mode = 'n',
      'godj',
      '<cmd>lua require("gopher").tags.rm "json"<CR>',
      desc = 'go tag delete json',
    },
    {
      mode = { 'n', 'v' },
      'gota',
      '<cmd>lua require("gopher").test.add()<CR>',
      desc = 'Generate one test for a specific function/method(one under cursor)',
    },
    {
      mode = 'n',
      'gote',
      '<cmd>lua require("gopher").test.exported()<CR>',
      desc = '" Generate tests for only  exported functions/methods in the current file',
    },
    {
      mode = 'n',
      'gota',
      '<cmd>lua require("gopher").test.all()<CR>',
      desc = 'Generate all tests for all functions/methods in the current file',
    },
    {
      mode = 'n',
      'gog',
      ':GoGet ',
      desc = 'go get',
    },
    {
      mode = 'n',
      'gom',
      ':GoMod init ',
      desc = 'go mode init',
    },
    {
      mode = 'n',
      'gop',
      ':GoImpl ',
      desc = 'go impl interface',
    },
    {
      mode = 'n',
      'goc',
      ':GoCmt<cr>',
      desc = 'go comment',
    },
  },
  -- branch = "develop", -- if you want develop branch
  -- keep in mind, it might break everything
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap', -- (optional) only if you use `gopher.dap`
  },
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  ---@type gopher.Config
  opts = {},
  config = function()
    require('gopher').setup {
      commands = {
        go = 'go',
        gomodifytags = 'gomodifytags',
        gotests = 'gotests',
        impl = 'impl',
        iferr = 'iferr',
        dlv = 'dlv',
      },
      gotests = {
        -- gotests doesn't have template named "default" so this plugin uses "default" to set the default template
        template = 'default',
        -- path to a directory containing custom test code templates
        template_dir = nil,
        -- switch table tests from using slice to map (with test name for the key)
        -- works only with gotests installed from develop branch
        named = false,
      },
      gotag = {
        transform = 'snakecase',
      },
    }
  end,
}
