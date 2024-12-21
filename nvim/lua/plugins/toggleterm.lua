return {
  'akinsho/toggleterm.nvim',

  -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

  keys = {
    {
      mode = {'n','t'},
      '<leader>tl',
      '<cmd>lua _LAZYGIT_TOGGLE()<cr>',
      desc = 'lazygit',
    },
    {
      mode = {'n','t'},
      '<leader>th',
      "<Cmd>exe v:count1 . 'ToggleTerm size=9 direction=horizontal'<CR>",
      silent = true,
    },
    {
      mode = {'n','t'},
      '<leader>tv',
      "<Cmd>exe v:count1 . 'ToggleTerm size=80 direction=vertical'<CR>",
      silent = true,
    },
    {

      mode = {'n','t'},
      '<leader>tf',
      "<Cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>",
      silent = true,
    },
  },
  config = function()
    local status_ok, toggleterm = pcall(require, 'toggleterm')
    if not status_ok then
      return
    end

    toggleterm.setup {
      size = 10,
      open_mapping = { [[<C-\>]], [[<C-]>]] },
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      -- start_in_insert = true,
      start_in_insert = false,
      insert_mappings = true,
      persist_size = false,
      direction = 'float',
      close_on_exit = true,
      auto_scroll = true,
      -- close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local node = Terminal:new { cmd = 'node', hidden = true }

    function _NODE_TOGGLE()
      node:toggle()
    end

    local python = Terminal:new { cmd = 'python3', hidden = true }

    function _PYTHON_TOGGLE()
      python:toggle()
    end

    local keymap = vim.keymap

    -- keymap.set("n", "<leader>tl", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { desc = "lazygit" })
    -- keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", { desc = "node" })
    -- keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", { desc = "python" })
    -- keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "float" })
    -- keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "horizontal" })
    -- keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "vertical" })

    -- Set autocmd to apply mappings for terminal buffers
    vim.cmd [[autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe j:count1 . "ToggleTerm"<CR>]]

    -- Apply mappings for normal mode and insert mode

    -- vim.api.nvim_set_keymap("n", "<leader>tn", "<Cmd>exe v:count1 . 'lua _NODE_TOGGLE()'<CR>", { silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>tp", "<Cmd>exe v:count1 . 'lua _PYTHON_TOGGLE()'<CR>", { silent = true })
    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "<leader>tf",
    --   "<Cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>",
    --   { silent = true }
    -- )

    -- Function to run `go run main.go` in ToggleTerm
    vim.api.nvim_set_keymap(
      'n',
      '<leader>ngr',
      ':ToggleTerm direction=horizontal<CR> nodemon --watch . --ext go --exec go run . --signal SIGTERM <CR>',
      { noremap = true, silent = true }
    )
  end,
}
