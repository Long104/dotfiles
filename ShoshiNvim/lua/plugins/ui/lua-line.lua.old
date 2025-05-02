-- return {
--   'glepnir/galaxyline.nvim',
--   'H97-Git/nerd-galaxyline-onedark',
--   config = function()
--     require('nerd-galaxyline-onedark').setup {}
--   end,
-- }

return {
  'nvim-lualine/lualine.nvim',
  -- { 'jcdickinson/wpm.nvim' },

  -- event = 'BufEnte',
  -- event = 'VeryLazy',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  priority = 900,
  opts = function(_, opts)
    local fg_color = '#212337' -- Foreground color for the text

       opts.theme = "catppuccin"
    -- Initialize opts.sections if it is nil
    opts.sections = opts.sections or {}
    -- opts.sections.lualine_a = {
    --
    --   }
    -- opts.sections.lualine_c = {
    --   {
    --     'diagnostics',
    --     symbols = {
    --       error = '',
    --       warn = '',
    --       info = '',
    --       hint = '',
    --     },
    --   },
    -- }
    -- opts.sections.lualine_c = {}
    opts.sections.lualine_y = {
      { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
      { 'location', padding = { left = 0, right = 1 } },
      -- {
      --   function()
      --     local words = vim.fn.wordcount()['words']
      --     return 'Words: ' .. words
      --   end,
      --   cond = function()
      --     local ft = vim.opt_local.filetype:get()
      --     local count = {
      --       latex = true,
      --       tex = true,
      --       text = true,
      --       markdown = true,
      --       vimwiki = true,
      --     }
      --     return count[ft] ~= nil
      --   end,
      -- },
    }

    opts.sections.lualine_z = {}

    local function get_permissions_color()
      local file = vim.fn.expand '%:p'
      if file == '' or file == nil then
        return 'No File', '#3c9dd0'
      else
        local permissions = vim.fn.getfperm(file)
        local owner_permissions = permissions:sub(1, 3)
        return permissions, owner_permissions == 'rwx' and '#086ca2' or '#549aab'
      end
    end

    local function decide_color()
      local hostname = vim.fn.systemlist('hostname')[1]
      local last_char = hostname:sub(-1)
      local bg_color = '#a48cf2'

      if last_char == '1' then
        bg_color = '#37f499'
      elseif last_char == '2' then
        bg_color = '#f16c75'
      elseif last_char == '3' then
        bg_color = '#f7c67f'
      end

      return bg_color
    end

    local bg_color = decide_color()

    opts.sections.lualine_x = opts.sections.lualine_x or {}
    table.insert(opts.sections.lualine_x, 1, {
      'hostname',
      color = { fg = fg_color, bg = bg_color, gui = 'bold' },
      separator = { left = '█', right = '' },
      padding = 0,
    })

    table.insert(opts.sections.lualine_x, 1, {
      function()
        if vim.bo.filetype ~= 'markdown' then
          local permissions, _ = get_permissions_color()
          return permissions
        else
          return ''
        end
      end,
      color = function()
        if vim.bo.filetype ~= 'markdown' then
          local _, permissions_bg_color = get_permissions_color()
          return { fg = fg_color, bg = permissions_bg_color, gui = 'bold' }
        else
          return { fg = fg_color, bg = bg_color, gui = 'bold' }
        end
      end,
      separator = { left = '█', right = '█ ' },
      padding = 0,
    })

    local function spell_status()
      if vim.wo.spell then
        local lang = vim.bo.spelllang
        if lang == 'en' then
          lang = 'English'
        elseif lang == 'es' then
          lang = 'Spanish'
        end
        return 'Spell: ' .. lang
      else
        return 'Spell: Off'
      end
    end

    local function spell_bg_color()
      if vim.wo.spell then
        return '#4c7a70'
      else
        return '#da785b'
      end
    end

    table.insert(opts.sections.lualine_x, 1, {
      spell_status,
      color = function()
        return { fg = fg_color, bg = spell_bg_color(), gui = 'bold' }
      end,
      separator = { left = '', right = '█ ' },
      padding = 0,
    })

    local function getWordsV2()
      local wc = vim.fn.wordcount()
      if wc['visual_words'] then -- text is selected in visual mode
        return wc['visual_words'] .. ' Words/' .. wc['visual_chars'] .. ' Chars (Vis)'
      else -- all of the document
        return wc['words'] .. ' Words' .. '/' .. wc['chars'] .. ' Chars'
      end
    end

    table.insert(opts.sections.lualine_x, 1, {
      getWordsV2,
      color = function()
        return { fg = fg_color, bg = '#88AA33', gui = 'bold' }
      end,
      separator = { left = '', right = '█ ' },
      padding = 0,
    })

    local function readingtime()
      return tostring(math.ceil(vim.fn.wordcount().words / 200.0)) .. ' min'
    end

    table.insert(opts.sections.lualine_x, 1, {
      readingtime,
      color = function()
        return { fg = fg_color, bg = '#2e536f', gui = 'bold' }
      end,
      separator = { left = '', right = '█ ' },
      padding = 0,
    })

    -- local function is_markdown()
    --   return vim.bo.filetype == 'markdown' or vim.bo.filetype == 'asciidoc'
    -- end
    -- table.insert(opts.sections.lualine_x, 1, {
    --   is_markdown,
    --   color = function()
    --     return { fg = fg_color, bg = '#497665', gui = 'bold' }
    --   end,
    --   separator = { left = '', right = '█ ' },
    --   padding = 0,
    -- })
    --
vim.opt.laststatus = 3
  end,
}
