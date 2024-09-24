return {
  'olimorris/codecompanion.nvim',
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>ac',
      '<cmd>CodeCompanionToggle<cr>',
      desc = 'toggle ai chat',
    },
    {
      mode = { 'n', 'x' },
      '<leader>ai',
      ':CodeCompanion ',
      desc = 'ask chat inline',
    },
    {
      mode = { 'n', 'x' },
      '<leader>am',
      ':CodeCompanionActions ',
      desc = 'companion actions',
    },
    {
      mode = { 'v' },
      '<leader>ah',
      '<cmd>CodeCompanionAdd<cr>',
      noremap = true,
      silent = true,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
    'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
    { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves the default Neovim UI
  },

  config = function()
    local function get_gemini_api_key()
      return os.getenv 'GEMINI_API_KEY'
    end

    local gemini_adapter = require('codecompanion.adapters').extend('gemini', {
      env = {
        api_key = get_gemini_api_key,
        model = 'schema.model.default',
      },
    })

    require('codecompanion').setup {
      opts = {
        send_code = true,
        log_level = 'DEBUG', -- or "TRACE"
      },
      display = {
        chat = {
          intro_message = 'Hello my brother ~ ',
        },
      },
      strategies = {
        chat = {
          adapter = 'gemini',
          roles = {
            llm = 'Yuki Suou', -- The markdown header content for the LLM's responses
            user = 'Masachika Kuze', -- The markdown header for your questions
          },
        },
        inline = {
          adapter = 'copilot',
        },
        agent = {
          adapter = 'gemini',
        },
      },
      adapters = {
        gemini = function()
          return gemini_adapter
        end,
      },
    }
  end,
}
-- for companion chat
-- Variables, accessed via #, contain data about the present state of Neovim:
--
-- #buffer - Shares the current buffer's code. You can also specify line numbers with #buffer:8-20
-- #editor - Shares the buffers and lines that you see in the Neovim viewport
-- #lsp - Shares LSP information and code for the current buffer
-- Slash commands, accessed via /, run commands to insert additional context into the chat buffer:
--
-- /buffer - Insert open buffers
-- /file - Insert a file
-- /help - Insert content from help tags
-- /now - Insert the current date and time
-- /symbols - Insert symbols for the active buffer
-- /terminal - Insert terminal output
-- Tools, accessed via @, allow the LLM to function as an agent and carry out actions:

--
-- @code_runner - The LLM will run code for you in a Docker container
-- @editor - The LLM will edit code in a Neovim buffer
-- @rag - The LLM will browse and search the internet for real-time information to supplement its respons

-- for companion
-- /buffer - Send the current buffer to the LLM alongside a prompt
-- /commit - Generate a commit message
-- /explain - Explain how selected code in a buffer works
-- /fix - Fix the selected code
-- /lsp - Explain the LSP diagnostics for the selected code
-- /tests - Generate unit tests for selected code
