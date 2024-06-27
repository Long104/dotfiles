return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'debugloop/telescope-undo.nvim',
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- 'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    'nvim-telescope/telescope-file-browser.nvim',
    'folke/todo-comments.nvim',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    -- local trouble = require("trouble.providers.telescope")
    local open_with_trouble = require('trouble.sources.telescope').open

    -- Use this to add more results without clearing the trouble list

    telescope.setup {
      extensions = {
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

      pickers = {
        find_files = {
          -- theme = "dropdown",
          -- theme = 'ivy',
        },
        -- undo = {
        --   theme = "dropdown",
        -- },
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
        layout_strategy = 'horizontal',
        -- layout_strategy = 'cursor',
        -- layout_strategy = 'center',
        layout_config = {
          -- preview_height = 0.7,
          preview_width = 0.57,
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
          -- horizontal = {
          --   height = 0.9,
          --   preview_cutoff = 120,
          --   prompt_position = "bottom",
          --   width = 0.8
          -- },
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
          i = {
            ['<c-k>'] = actions.move_selection_previous, -- move to prev result
            ['<c-j>'] = actions.move_selection_next, -- move to next result
            ['<c-b>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<c-;>'] = open_with_trouble,
          },
          n = { ['<c-;>'] = open_with_trouble },
          -- ["<c-b>"] = trouble.open_with_trouble,},
        },
        -- n = { ["<c-b>"] = trouble.open_with_trouble },
      },
    }
    telescope.load_extension 'fzf'
    -- telescope.load_extension("zoxide")
    -- telescope.load_extension("neoclip")
    local builtin = require 'telescope.builtin'
    require('telescope').load_extension 'bookmarks'
    require('telescope').load_extension 'undo'
    require('telescope').load_extension 'advanced_git_search' -- set keymaps local keymap = vim.keymap -- for conciseness
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope treesitter<cr>', { desc = 'serach treesitter' })
    -- vim.keymap.set('n', '<leader>fha', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>ftl', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>ft', '<cmd>Telescope buffers<cr>', { desc = 'find buffer' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<cr>', { desc = 'in path' })
    vim.keymap.set('n', '<leader>fp', ':Telescope file_browser path=%:p:h select_buffer=true<cr>', { desc = 'current' })
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'fuzzy find files in cwd' })
    vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'fuzzy find recent files' })
    vim.keymap.set('n', '<leader>fl', '<cmd>Telescope live_grep<cr>', { desc = 'find string in cwd' })
    vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', { desc = 'find string under cursor in cwd' })
    vim.keymap.set('n', '<leader>ftc', '<cmd>TodoTelescope<cr>', { desc = 'find todos' })
    vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fgc', '<cmd>Telescope advanced_git_search checkout_reflog<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fgd', '<cmd>Telescope advanced_git_search diff_branch_file<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fgb', '<cmd>Telescope advanced_git_search changed_on_branch<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fgsc', '<cmd>Telescope advanced_git_search search_log_content<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fgsl', '<cmd>Telescope advanced_git_search search_log_content_file<cr>', { noremap = true })

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
  end,
}
