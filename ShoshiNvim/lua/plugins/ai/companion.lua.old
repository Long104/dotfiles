return {
  'olimorris/codecompanion.nvim',
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>ac',
      '<cmd>CodeCompanionChat Toggle<cr>',
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
      '<cmd>CodeCompanionChat Add<cr>',
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
          adapter = 'gemini',
          prompts = {
            -- The prompt to send to the LLM when a user initiates the inline strategy and it needs to convert to a chat
            inline_to_chat = function(context)
              return string.format(
                [[ 
                 'first line have to start with "My brother ~" then continue with the prompt:' Let's discuss a topic or concept that I'm curious about, and you'll ask me questions to help me explore it further. We'll work together to build a deep understanding of the topic, and you'll provide feedback to help me identify any misconceptions or gaps in my understanding, sort of like the Feynman technique. We'll approach this with an open mind, and we'll be curious and inquisitive as we explore the topic.
                  I want you to keep in mind that you do also ask specific questions that will push my understanding of said topic, it doesn't matter if I'm not capable of answering cause my goal is to learn more and more. Let's begin.
              ]],
                context.filetype
              )
            end,
          },
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
      pre_defined_prompts = {
        ['Custom Prompt'] = {
          strategy = 'inline',
          description = 'learning',
          opts = {
            index = 3,
            default_prompt = true,
            mapping = '<LocalLeader>cc',
            user_prompt = true,
          },
          prompts = {
            {
              role = 'Yuki Suou',
              content = function(context)
                return string.format(
                  [[Act as a veteran teacher, skilled at communicating clearly with colleagues and students’ caregivers. Your task is to draft a summary of this annual review meeting based on the notes in the attached file. Clearly identify the actionable items, who will take ownership of each actionable item, and next steps for the family ]],
                  context.filetype
                )
              end,
              opts = {
                visible = false,
                tag = 'system_tag',
              },
            },
          },
        },
        ['Explain'] = {
          strategy = 'chat',
          description = 'Explain how code in a buffer works',
          opts = {
            index = 4,
            default_prompt = true,
            mapping = '<LocalLeader>ce',
            modes = { 'v' },
            slash_cmd = 'explain',
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = 'Yuki Suou',
              content = [[
You are an expert teacher with excellent communication and interpersonal skills, particularly skilled in distilling and reframing complicated topics for specific audiences. Your task is to explain the concept of refraction of light in water in simple terms, so that my 5th grade science class can understand why their straws look bent in their water glasses. 
]],
              opts = {
                visible = false,
              },
            },
            {
              role = 'Masachika Kuze',
              content = function(context)
                local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)

                return string.format(
                  [[Please explain this thing:

```%s
%s
```
]],
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ['Use Case'] = {
          strategy = 'Yuki Suou',
          description = 'show use case',
          opts = {
            index = 5,
            default_prompt = true,
            mapping = '<LocalLeader>ct',
            modes = { 'v' },
            slash_cmd = 'tests',
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = 'Yuki Suou',
              content = [[
You are an expert teacher skilled in developing measurable, short-term objectives derived from broader learning goals. Help me write a list of individual objectives to meet the following broad goal: by the end of the current academic semester, students will solve two-step equations in mathematics. Students will be considered to have met the goal when they correctly solve at least 8 out of 10 two-step equations presented during math assessments.
]],
              opts = {
                visible = false,
              },
            },
            {
              role = 'Masachika Kuze',
              content = function(context)
                local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)

                return string.format(
                  [[please give use case for me:

```%s
%s
```
]],
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ['Fix grammar'] = {
          strategy = 'chat',
          description = 'Fix grammar',
          opts = {
            index = 6,
            default_prompt = true,
            mapping = '<LocalLeader>cf',
            modes = { 'v' },
            slash_cmd = 'fix',
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = 'system',
              content = [[
              fix my grammar for me
]],
              opts = {
                visible = false,
              },
            },
            {
              role = 'Masachika Kuze',
              content = function(context)
                local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)

                return string.format(
                  [[Please fix this grammar:

```%s
%s
```
]],
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ['Buffer selection'] = {
          strategy = 'inline',
          description = 'Send the current buffer to the LLM as part of an inline prompt',
          opts = {
            index = 7,
            modes = { 'v' },
            default_prompt = true,
            mapping = '<LocalLeader>cb',
            slash_cmd = 'buffer',
            auto_submit = true,
            user_prompt = true,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = 'system',
              content = function(context)
                return 'I want you to act as a kind teacher that explain to me '
                  .. context.filetype
                  .. ' You are an expert student with superb comprehension and communication skills, skilled in reading, understanding, and summarizing the main points of large sections of dense texts. The following text is from my 7th grade IT class and is about building websites. Your task is to summarize the text, providing bullet points for the main ideas, steps, and vocabulary.'
              end,
              opts = {
                visible = false,
                tag = 'system_tag',
              },
            },
            {
              role = 'Masachika Kuze',
              content = function(context)
                local buf_utils = require 'codecompanion.utils.buffers'

                return '```' .. context.filetype .. '\n' .. buf_utils.get_content(context.bufnr) .. '\n```\n\n'
              end,
              opts = {
                contains_code = true,
                visible = false,
              },
            },
            {
              role = 'Masachika Kuze',
              condition = function(context)
                return context.is_visual
              end,
              content = function(context)
                local selection = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)

                return string.format(
                  [[And this some something relate to my question:

```%s
%s
```
]],
                  context.filetype,
                  selection
                )
              end,
              opts = {
                contains_code = true,
                visible = true,
                tag = 'visual',
              },
            },
          },
        },
        ['Explain LSP Diagnostics'] = {
          strategy = 'chat',
          description = 'Explain the LSP diagnostics for the selected code',
          opts = {
            index = 8,
            default_prompt = true,
            mapping = '<LocalLeader>cl',
            modes = { 'v' },
            slash_cmd = 'lsp',
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = 'Yuki Suou',
              content = [[You are an expert coder and helpful assistant who can help debug code diagnostics, such as warning and error messages. When appropriate, give solutions with code snippets as fenced codeblocks with a language identifier to enable syntax highlighting.]],
              opts = {
                visible = false,
              },
            },
            {
              role = 'Masachika Kuze',
              content = function(context)
                local diagnostics = require('codecompanion.helpers.actions').get_diagnostics(context.start_line, context.end_line, context.bufnr)

                local concatenated_diagnostics = ''
                for i, diagnostic in ipairs(diagnostics) do
                  concatenated_diagnostics = concatenated_diagnostics
                    .. i
                    .. '. Issue '
                    .. i
                    .. '\n  - Location: Line '
                    .. diagnostic.line_number
                    .. '\n  - Severity: '
                    .. diagnostic.severity
                    .. '\n  - Message: '
                    .. diagnostic.message
                    .. '\n'
                end

                return string.format(
                  [[The programming language is %s. This is a list of the diagnostic messages:

%s
]],
                  context.filetype,
                  concatenated_diagnostics
                )
              end,
            },
            {
              role = 'Masachika Kuze',
              content = function(context)
                local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line, { show_line_numbers = true })
                return string.format(
                  [[This is the code, for context:

```%s
%s
```
]],
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ['Generate a Commit Message'] = {
          strategy = 'chat',
          description = 'Generate a commit message',
          opts = {
            index = 9,
            default_prompt = true,
            mapping = '<LocalLeader>cm',
            slash_cmd = 'commit',
            auto_submit = true,
          },
          prompts = {
            {
              role = 'Masachika Kuze',
              content = function()
                return string.format(
                  [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```
]],
                  vim.fn.system 'git diff'
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
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
