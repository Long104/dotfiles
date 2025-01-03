
-- Custom Parameters (with defaults)
return {
    "David-Kunz/gen.nvim",
    keys = {{
mode = { 'n', 'v' }, '<leader>]', ':Gen<CR>'
    },
    {
mode ='v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>'
    }

  },
    opts = {
        -- model = "mistral", -- The default model to use.
        model = "llama3.2:lastest", -- The default model to use.
        quit_map = "q", -- set keymap for close the response window
        retry_map = "<c-r>", -- set keymap to re-send the current prompt
        accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
        host = "localhost", -- The host running the Ollama service.
        port = "11434", -- The port on which the Ollama service is listening.
        display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
        show_prompt = false, -- Shows the prompt submitted to Ollama.
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = false, -- Never closes the window automatically.
        hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
        init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
        -- Function to initialize Ollama
        command = function(options)
            local body = {model = options.model, stream = true}
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
        -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
        -- This can also be a command string.
        -- The executed command must return a JSON object with { response, context }
        -- (context property is optional).
        -- list_models = '<omitted lua function>', -- Retrieves a list of model names
        debug = false -- Prints errors and the command which is run.
    }
    ,
    config = function ()
  require('gen').prompts['Elaborate_Text'] = {
  prompt = "Elaborate the following text:\n$text",
  replace = true
}
require('gen').prompts['Fix_Code'] = {
  prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

  -- require('gen').prompts['Elaborate_Text'] = {
  --   prompt = "Elaborate the following text:\n$text",
  --   replace = true
  -- }
  -- require('gen').prompts['Fix_Code'] = {
  --   prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  --   replace = true,
  --   extract = "```$filetype\n(.-)```"
  -- }
  -- require('gen').prompts['DevOps me!'] = {
  --   prompt = "You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, kubernetes, python. You answer with code examples when possible. $input:\n$text",
  --   replace = true
  -- }

    end
}
-- You can use the following properties per prompt:
--
-- prompt: (string | function) Prompt either as a string or a function which should return a string. The result can use the following placeholders:
-- $text: Visually selected text or the content of the current buffer
-- $filetype: File type of the buffer (e.g. javascript)
-- $input: Additional user input
-- $register: Value of the unnamed register (yanked text)
-- replace: true if the selected text shall be replaced with the generated output
-- extract: Regular expression used to extract the generated result
-- model: The model to use, e.g. zephyr, default: mistral
