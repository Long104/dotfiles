return {
  'nvim-neotest/neotest',

  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'fredrikaverpil/neotest-golang',
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-jest',
-- "zidhuss/neotest-minitest",
  },

  keys = {
    {
      '<leader>td',
      function()
        require('neotest').run.run { suite = false, strategy = 'dap' }
      end,
      desc = 'Debug nearest test',
    },
    { '<leader>t', '', desc = '+test' },
    {
      '<leader>tt',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run File',
    },
    -- { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run Nearest',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Run Last',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle Summary',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open { enter = true, auto_close = true }
      end,
      desc = 'Show Output',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle Output Panel',
    },
    {
      '<leader>tS',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand '%')
      end,
      desc = 'Toggle Watch',
    },
  },

  config = function()
    local config = { -- Specify configuration
      go_test_args = {
        '-v',
        '-race',
        '-count=1',
        '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
      },
      dap_go_enabled = true,
    }
    ---@diagnostic disable-next-line: missing-fields
    require('neotest').setup {
      adapters = {
        require 'neotest-golang'(config),
        require 'neotest-vitest' {
          -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
          filter_dir = function(name, rel_path, root)
            return name ~= 'node_modules'
          end,
        },
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        -- adapters = {
        --   require 'neotest-minitest',
        -- },
      },
      ---@diagnostic disable-next-line: missing-fields
      discovery = {
        enabled = false,
      },
      ---@diagnostic disable-next-line: missing-fields
      status = { virtual_text = true },
      ---@diagnostic disable-next-line: missing-fields
      output = { open_on_run = true },
    }

    vim.api.nvim_set_keymap('n', '<leader>twr', "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>", { desc = 'Run Watch' })

    vim.api.nvim_set_keymap(
      'n',
      '<leader>twf',
      "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>",
      { desc = 'Run Watch File' }
    )
 -- test_cmd = function()
 --    return vim.tbl_flatten({
 --      "bundle",
 --      "exec",
 --      "rails",
 --      "test",
    -- })
  -- end
  end,
  -- stylua: ignore
}
