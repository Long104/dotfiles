return {
  'catppuccin/nvim',
  -- event = { 'BufReadPre', 'BufWritePost', 'BufNewFile' },
  name = 'catppuccin',
  priority = 1000,
  config = function()
    -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    require('catppuccin').setup {
      flavour = 'auto', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.

      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.flamingo },
          TabLineSel = { bg = colors.pink },
          CmpBorder = { fg = colors.surface2 },
          Pmenu = { bg = colors.none },
        }
      end,

      highlight_overrides = {
        all = function(colors)
          return {
            NvimTreeNormal = { fg = colors.none },
            CmpBorder = { fg = '#3e4145' },
          }
        end,
        latte = function(latte)
          return {
            Normal = { fg = latte.base },
          }
        end,
        frappe = function(frappe)
          return {
            ['@comment'] = { fg = frappe.surface2, style = { 'italic' } },
          }
        end,
        macchiato = function(macchiato)
          return {
            LineNr = { fg = macchiato.overlay1 },
          }
        end,
        mocha = function(mocha)
          return {
            Comment = { fg = mocha.flamingo },
          }
        end,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        aerial = true,
        noice = true,
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
        mini = {
          enabled = true,
          indentscope_color = '',
        },
      },
    }

    -- vim.cmd.colorscheme 'catppuccin-mocha'
    vim.cmd.colorscheme 'catppuccin'
  end,
}
