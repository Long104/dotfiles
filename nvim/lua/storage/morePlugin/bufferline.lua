return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  -- event = { "UIEnter" },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = function()
    local opts = function(desc)
      return { desc = desc, noremap = true, silent = true }
    end
    local keymap = vim.keymap.set
    local bufferline = require "bufferline"
    bufferline.setup {
      options = {
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 15,
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        themable = false, -- allows highlight groups to be overriden i.e. sets highlights as default
        pick = {
          alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
        },
        -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
        show_buffer_close_icons = false,
        always_show_bufferline = false,

        indicator = {
          icon = "|", -- this should be omitted if indicator style is not 'icon'
          -- style = "icon" | "underline" | "none",
          style = "none",
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = false, -- use ae"true" to enable the default, or set your own character
          },
        },
        custom_filter = function(buf_number)
          if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
            return true
          end
        end,
        -- sort_by = function(buffer_a, buffer_b)
        --   local mod_a = ((vim.loop.fs_stat(buffer_a.path) or {}).mtime or {}).sec or 0
        --   local mod_b = ((vim.loop.fs_stat(buffer_b.path) or {}).mtime or {}).sec or 0
        --   return mod_a > mod_b
        -- end,

        enforce_regular_tabs = true,
        -- separator_style = "slope",
        separator_style = "thin",
        -- separator_style = 'slant',

        -- diagnostics = "nvim_lsp",
        --
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   local s = " "
        --   for e, n in pairs(diagnostics_dict) do
        --     local sym = e == "error" and " " or (e == "warning" and " " or " ")
        --     s = s .. n .. sym
        --   end
        --   return s
        -- end,
      },
      highlights = {
        fill = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
        },
        background = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
        },
        tab = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
        },
        tab_selected = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
        },
        tab_separator = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
          gui = "NONE",
          sp = "NONE",
        },
        tab_separator_selected = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
          sp = "NONE",
          gui = "NONE",
          -- underline = true,
        },
        offset_separator = {
          fg = "NONE",
          bg = "NONE",
        },
        buffer_selected = {
          fg = "NONE",
          bg = "NONE", -- Transparent background
          bold = true,
          italic = true,
          underline = true,
        },
      },
    }

    -- buffer
    keymap("n", "bd", "<cmd>bp|bd #<CR>", opts "Close current tab")
    -- keymap("n", "ba", "<cmd>%bd|e#|bd#<CR>", opts "Close all tab only the one not")
    keymap("n", "ba", "<cmd>BufferLineCloseOthers<CR>", opts "Close all tab only the one not")
    keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts "Go to next tab")
    keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts "Go to previous tab")
    keymap("n", "bf", "<cmd>BufferLinePick<CR>", opts "buffer line pick")
    keymap("n", "bp", ":BufferLineTogglePin<CR>", opts "pin buffer")
    keymap("n", "bc", ":BufferLineGoToBuffer<CR>", opts "go to buffer")
    -- tabs
    -- keymap("n", "ta", "<cmd>tabonly<cr>", opts "close all tab")
    -- keymap("n", "X", "<cmd>tabclose<cr>", opts "tab close")
    -- keymap("n", "t", "<cmd>tabedit<cr>", opts "create")
    -- keymap("n", "tl", "<cmd>tabs<cr>", opts "view all tab")
    -- keymap("n", "<S-k>", "<cmd>tabn<cr>", opts "tabnext")
    -- keymap("n", "<S-j>", "<cmd>tabp<cr>", opts "tabprev")

    -- vim.cmd [[
    --    hi BufferLineFill guibg=NONE
    --    hi BufferLineSeparator guibg=NONE
    --    hi BufferLineSeparatorVisible guibg=NONE
    --    hi BufferLineBuffer guibg=NONE
    --    hi BufferLineBufferVisible guibg=NONE
    --    hi BufferLineBufferSelected guibg=NONE
    --    hi BufferLineBackground guibg=NONE
    --    hi BufferLineTab guibg=NONE
    --    hi BufferLineTabSelected guibg=NONE
    --    hi BufferLineTabClose guibg=NONE
    --  ]]
  end,
}
