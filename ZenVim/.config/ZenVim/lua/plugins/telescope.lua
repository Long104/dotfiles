return {
  'nvim-telescope/telescope.nvim',
  -- <C-x>	Go to file selection as a split
  -- <C-v>	Go to file selection as a vsplit
  dependencies = {
    -- image
    -- 'nvim-telescope/telescope-media-files.nvim',
    'nvim-lua/popup.nvim',
    'debugloop/telescope-undo.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- 'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    -- 'nvim-telescope/telescope-file-browser.nvim',
    -- 'folke/todo-comments.nvim',
  },
  keys = {
    { mode = 'n', '<leader>fz', '<cmd>Telescope frecency<cr>', desc = 'Frecency' },
    { mode = 'n', '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = '[S]earch [K]eymaps' },
    { mode = 'n', '<leader>ftl', '<cmd>Telescope builtin<cr>', desc = '[S]earch [S]elect Telescope' },
    { mode = 'n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
    { mode = 'n', '<leader>fh', '<cmd>Telescope treesitter<cr>', desc = 'serach treesitter' },
    { mode = 'n', '<leader>fha', 'Telescope help_tags', desc = '[S]earch [H]elp' },
    { mode = 'n', '<leader>ft', '<cmd>Telescope buffers<cr>', desc = 'find buffer' },
    -- { mode = 'n', '<leader><leader>', 'Telescope resume', desc = '[S]earch [R]esume' },
    -- { mode = 'n', '<leader>fb', ':Telescope file_browser<cr>', desc = 'in path' },
    -- { mode = 'n', '<leader>fp', ':Telescope file_browser path=%:p:h select_buffer=true<cr>', desc = 'current' },
    { mode = 'n', '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'fuzzy find files in cwd' },
    { mode = 'n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'fuzzy find recent files' },
    { mode = 'n', '<leader>fl', '<cmd>Telescope live_grep<cr>', desc = 'find string in cwd', silent = true },
    { mode = {"n","x"}, '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'find string under cursor in cwd' },
    { mode = 'n', '<leader>fr', '<cmd>Telescope registers<cr>', noremap = true },
    -- { mode = 'n', '<leader>fm', '<cmd>Telescope marks<cr>', noremap = true },
    { mode = 'n', '<leader>fgl', '<cmd>lua require("telescope").extensions.lazygit.lazygit()<cr>', desc = 'lazy git' },
    { mode = 'n', '<leader>fu', '<cmd>Telescope undo<cr>', noremap = true },
    { mode = 'n', '<leader>fgs', '<cmd>Telescope advanced_git_search<cr>', desc = 'serach treesitter' },
    { mode = 'n', '<leader>fgc', '<cmd>Telescope advanced_git_search checkout_reflog<cr>', noremap = true },
    { mode = 'n', '<leader>fgd', '<cmd>Telescope advanced_git_search diff_branch_file<cr>', noremap = true },
    { mode = 'n', '<leader>fgb', '<cmd>Telescope advanced_git_search changed_on_branch<cr>', noremap = true },
    { mode = 'n', '<leader>fgsc', '<cmd>Telescope advanced_git_search search_log_content<cr>', noremap = true },
  },
  cmd = 'Telescope',
  branch = '0.1.x',
  version = false,
  config = function()
    local focus_preview = function(prompt_bufnr)
      local action_state = require 'telescope.actions.state'
      local picker = action_state.get_current_picker(prompt_bufnr)
      local prompt_win = picker.prompt_win
      local previewer = picker.previewer
      local winid = previewer.state.winid
      local bufnr = previewer.state.bufnr
      vim.keymap.set('n', '<Tab>', function()
        vim.cmd(string.format('noautocmd lua vim.api.nvim_set_current_win(%s)', prompt_win))
      end, { buffer = bufnr })
      vim.cmd(string.format('noautocmd lua vim.api.nvim_set_current_win(%s)', winid))
      -- api.nvim_set_current_win(winid)
    end

    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

-- require("telescope").load_extension("noice")
    -- require('telescope').load_extension('dap')
    require('telescope').load_extension 'frecency'
    -- require('telescope').load_extension 'media_files'
    -- require('telescope').load_extension 'lazygit'
    -- telescope.load_extension 'fzf'

    telescope.setup {
      extensions = {

        frecency = {
          show_scores = true, -- Default: false
          -- If `true`, it shows confirmation dialog before any entries are removed from the DB
          -- If you want not to be bothered with such things and to remove stale results silently
          -- set db_safe_mode=false and auto_validate=true
          --
          -- This fixes an issue I had in which I couldn't close the floating
          -- window because I couldn't focus it
          db_safe_mode = false, -- Default: true
          -- If `true`, it removes stale entries count over than db_validate_threshold
          auto_validate = true, -- Default: true
          -- It will remove entries when stale ones exist more than this count
          db_validate_threshold = 10, -- Default: 10
          -- Show the path of the active filter before file paths.
          -- So if I'm in the `dotfiles-latest` directory it will show me that
          -- before the name of the file
          show_filter_column = false, -- Default: true
          -- I declare a workspace which I will use when calling frecency if I
          -- want to search for files in a specific path
          -- workspaces = {
          --   ['neobean_plugins'] = '$HOME/github/dotfiles-latest/neovim/neobean/lua/plugins',
          -- },
        },

        undo = {
          side_by_side = true,
          layout_strategy = 'vertical',
          -- layout_strategy = "horizontal",
          layout_config = {
            preview_height = 0.7,
            -- preview_width = 70,
            vertical = { width = 0.7 },
            horizontal = { width = 0.7 },
          },
          -- telescope-undo.nvim config, see below
        },
        --advaced_git_search
        advanced_git_search = {

          -- See Config
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },

      defaults = {

        sorting_strategy = 'ascending',
        prompt_prefix = '  ',
        selection_caret = '  ',
        border = true,
        hl_result_eol = true,
        results_title = false,
        preview = { hide_on_startup = false },
        --
        -- side_by_side = true,
        -- layout_strategy = 'vertical',
        -- layout_strategy = 'horizontal',
        -- layout_strategy = 'cursor',
        -- layout_strategy = 'center',
        layout_config = {
          -- preview_height = 0.7,
          -- preview_width = 0.57,
          -- prompt_position = 'bottom',
          prompt_position = 'top',

          -- center = {
          --   anchor = 'S',
          --   height = 0.45,
          --   width = function(_, max_columns, _)
          --     return max_columns
          --   end,
          -- },
          --   bottom_pane = {
          --     height = 25,
          --     preview_cutoff = 120,
          --     prompt_position = "top"
          --   },
          -- center = {
          --   height = 0.4,
          --   preview_cutoff = 40,
          --   prompt_position = 'top',
          --   width = 0.5,
          -- },
          --   cursor = {
          --     height = 0.9,
          --     preview_cutoff = 40,
          --     width = 0.8
          --   },
          horizontal = {
            -- height = 0.9,
            -- preview_cutoff = 120,
            -- prompt_position = 'bottom',
            prompt_position = 'top',
            -- width = 0.8,
            preview_width = 0.57,
          },
          --   vertical = {
          --     height = 0.9,
          --     preview_cutoff = 40,
          --     prompt_position = "bottom",
          --     width = 0.8
          --   }
          -- },
        },

        path_display = { 'smart' },
        mappings = {
          n = {
            ['<Tab>'] = focus_preview,
          },
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-b>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<Tab>'] = focus_preview,
            -- will open
            -- ['<c-;>'] = open_with_trouble,
          },
          -- will open
          -- n = { ['<c-;>'] = open_with_trouble },
          -- ["<c-b>"] = trouble.open_with_trouble,},
        },
        -- n = { ["<c-b>"] = trouble.open_with_trouble },
      },
    }

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = true,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })


    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = '~/obsedian/NGNl/' }
    end, { desc = 'find file note' })


    vim.keymap.set('n', '<leader>fq', function()
      builtin.find_files { cwd = '~/obsedian/' }
    end, { desc = 'find file obsedian' })

    -- vim.keymap.set('n', '<leader>fz', function()
    --   builtin.find_files { cwd = '~/' }
    -- end, { desc = '[S]earch [N]eovim files' })
  end,
}
