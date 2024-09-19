return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  lazy = false,
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local builtin = require 'telescope.builtin'

    -- Set header

    -- dashboard.section.header.val = {
    --   '                                                     ',
    --   '  ███████╗███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
    --   '  ██╔════╝████╗  ██║██╔═══██╗██║   ██║██║████╗ ████║ ',
    --   '  ███████╗██╔██╗ ██║██║   ██║██║   ██║██║██╔████╔██║ ',
    --   '  ╚════██║██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
    --   '  ███████║██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
    --   '  ╚══════╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
    --   '                                                     ',
    -- }

    dashboard.section.header.val = {
      '⠀⠀⠀⠀⠀⠀⠀⣠⡤⠶⡄⠀⠀⠀⠀⠀⠀⠀⢠⠶⣦⣀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⢀⣴⣿⡟⠀⠈⣀⣾⣝⣯⣿⣛⣷⣦⡀⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀',
      '⠀⠀⠀⣴⣿⣿⣿⡇⠀⢼⣿⣽⣿⢻⣿⣻⣿⣟⣷⡄⠀⢸⣿⣿⣾⣄⠀⠀⠀',
      '⠀⠀⣞⣿⣿⣿⣿⣷⣤⣸⣟⣿⣿⣻⣯⣿⣿⣿⣿⣀⣴⣿⣿⣿⣿⣯⣆⠀⠀',
      '⠀⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⡆⠀',
      '⢠⣟⣯⣿⣿⣿⣷⢿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣟⠿⣿⣿⣿⣿⡷⣾⠀',
      '⢸⣯⣿⣿⡏⠙⡇⣾⣟⣿⡿⢿⣿⣿⣿⣿⣿⢿⣟⡿⣿⠀⡟⠉⢹⣿⣿⢿⡄',
      '⢸⣯⡿⢿⠀⠀⠱⢈⣿⢿⣿⡿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣀⠃⠀⢸⡿⣿⣿⡇',
      '⢸⣿⣇⠈⢃⣴⠟⠛⢉⣸⣇⣹⣿⣿⠚⡿⣿⣉⣿⠃⠈⠙⢻⡄⠎⠀⣿⡷⠃',
      '⠈⡇⣿⠀⠀⠻⣤⠠⣿⠉⢻⡟⢷⣝⣷⠉⣿⢿⡻⣃⢀⢤⢀⡏⠀⢠⡏⡼⠀',
      '⠀⠘⠘⡅⠀⣔⠚⢀⣉⣻⡾⢡⡾⣻⣧⡾⢃⣈⣳⢧⡘⠤⠞⠁⠀⡼⠁⠀⠀',
      '⠀⠀⠀⠸⡀⠀⢠⡎⣝⠉⢰⠾⠿⢯⡘⢧⡧⠄⠀⡄⢻⠀⠀⠀⢰⠁⠀⠀⠀',
      '⠀⠀⠀⠀⠁⠀⠈⢧⣈⠀⠘⢦⠀⣀⠇⣼⠃⠰⣄⣡⠞⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢤⠼⠁⠀⠀⠳⣤⡼⠀⠀⠀⠀⠀⠀',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('SPC fb', '  > New File', '<cmd>Telescope file_browser<CR>'),
      dashboard.button('SPC e', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC ff', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fs', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC tt', ' > play termtyper', '<cmd>:term termtyper<CR>'),
      dashboard.button(
        'SPC fhy',
        ' > config hypr',
        vim.keymap.set('n', '<leader>fhy', function()
          builtin.find_files { cwd = '~/.config/hypr' }
        end, { desc = 'config hypr' })
      ),
      dashboard.button(
        'SPC fc',
        '  > config neovim',
        vim.keymap.set('n', '<leader>fc', function()
          builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
      ),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
