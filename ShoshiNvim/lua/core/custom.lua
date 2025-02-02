vim.api.nvim_create_user_command('GitRefresh', function()
  vim.cmd 'e'
  vim.cmd 'bufdo e'
  vim.cmd 'NvimTreeRefresh'
end, {})

vim.keymap.set('i', '<C-g>', function()
  -- Insert the text in the desired format
  vim.cmd 'normal! a[](){:target="_blank"} '
  vim.cmd 'normal! F(pv2F/lyF[p'
  -- Leave me in normal mode or command mode
  vim.cmd 'stopinsert'
end, { desc = '[P]Paste Github link' })

vim.keymap.set('n', '<leader>gC', function()
  -- Check if GitHub CLI is installed
  local gh_installed = vim.fn.system 'command -v gh'
  if gh_installed == '' then
    print "GitHub CLI is not installed. Please install it using 'brew install gh'."
    return
  end
  -- Get the current working directory and extract the repository name
  local cwd = vim.fn.getcwd()
  local repo_name = vim.fn.fnamemodify(cwd, ':t')
  if repo_name == '' then
    print 'Failed to extract repository name from the current directory.'
    return
  end
  -- Display the message and ask for confirmation
  local confirmation = vim.fn.input('The name of the repo will be: "' .. repo_name .. '"\nType "yes" to continue: ')
  if confirmation:lower() ~= 'yes' then
    print 'Operation canceled.'
    return
  end
  -- Check if the repository already exists on GitHub
  local check_repo_command = string.format('gh repo view %s/%s', vim.fn.system("gh api user --jq '.login'"):gsub('%s+', ''), repo_name)
  local check_repo_result = vim.fn.systemlist(check_repo_command)
  if not string.find(table.concat(check_repo_result), 'Could not resolve to a Repository') then
    print("Repository '" .. repo_name .. "' already exists on GitHub.")
    return
  end
  -- Prompt for repository type
  local repo_type = vim.fn.input('Enter the repository type (private/public): '):lower()
  if repo_type ~= 'private' and repo_type ~= 'public' then
    print "Invalid repository type. Please enter 'private' or 'public'."
    return
  end
  -- Set the repository type flag
  local repo_type_flag = repo_type == 'private' and '--private' or '--public'
  -- Initialize the git repository and create the GitHub repository
  local init_command = string.format('cd %s && git init', vim.fn.shellescape(cwd))
  vim.fn.system(init_command)
  local create_command = string.format('cd %s && gh repo create %s %s --source=.', vim.fn.shellescape(cwd), repo_name, repo_type_flag)
  local create_result = vim.fn.system(create_command)
  -- Print the result of the repository creation command
  if string.find(create_result, 'https://github.com') then
    print("Repository '" .. repo_name .. "' created successfully.")
  else
    print('Failed to create the repository: ' .. create_result)
  end
end, { desc = '[P]Create GitHub repository' })

vim.keymap.set('n', 'ms', function()
  -- Simulate pressing "z=" with "m" option using feedkeys
  -- vim.api.nvim_replace_termcodes ensures "z=" is correctly interpreted
  -- 'M' is the {mode}, which in this case is 'Remap keys'. This is default.
  -- If {mode} is absent, keys are remapped.
  --
  -- I tried this keymap as usually with
  vim.cmd 'normal! 1z='
  -- But didn't work, only with nvim_feedkeys
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("z=", true, false, true), "m", true)
end, { desc = '[P]Spelling suggestions' })

vim.keymap.set('n', 'mss', function()
  -- Simulate pressing "z=1<CR>" to automatically pick the first suggestion
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('z=', true, false, true), 'n', false)
end, { desc = '[P]Spelling suggestions', silent = true, noremap = true })
-- vim.keymap.set('n', 'mss', function()
--   -- Simulate pressing "z=" with "m" option using feedkeys
--   -- vim.api.nvim_replace_termcodes ensures "z=" is correctly interpreted
--   -- 'M' is the {mode}, which in this case is 'Remap keys'. This is default.
--   -- If {mode} is absent, keys are remapped.
--   --
--   -- I tried this keymap as usually with
--   vim.cmd 'normal! z='
--   -- But didn't work, only with nvim_feedkeys
--   -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("z=", true, false, true), "m", true)
-- end, { desc = '[P]Spelling suggestions', silent = true, noremap = true })

-- Delete newlines in selected text (join)
vim.keymap.set('v', '<leader>mj', function()
  -- Get the visual selection range
  local start_row = vim.fn.line 'v'
  local end_row = vim.fn.line '.'
  -- Ensure start_row is less than or equal to end_row
  if start_row > end_row then
    start_row, end_row = end_row, start_row
  end
  -- Loop through each line in the selection
  local current_row = start_row
  while current_row <= end_row do
    local line = vim.api.nvim_buf_get_lines(0, current_row - 1, current_row, false)[1]
    -- vim.notify("Checking line " .. current_row .. ": " .. (line or ""), vim.log.levels.INFO)
    -- If the line is empty, delete it and adjust end_row
    if line == '' then
      vim.cmd(current_row .. 'delete')
      end_row = end_row - 1
    else
      current_row = current_row + 1
    end
  end
end, { desc = '[P]Delete newlines in selected text (join)' })

-- spell language settings
vim.keymap.set('n', '<leader>msle', function()
  vim.opt.spelllang = 'en'
  vim.cmd "echo 'Spell language set to English'"
end, { desc = '[P]Spelling language English' })

vim.keymap.set('n', '<leader>mslb', function()
  vim.opt.spelllang = 'en,es'
  vim.cmd "echo 'Spell language set to Spanish and English'"
end, { desc = '[P]Spelling language Spanish and English' })

vim.keymap.set('n', '<leader>msg', function()
  vim.cmd 'normal! zg'
end, { desc = '[P]Spelling add word to spellfile' })

vim.keymap.set('n', '<leader>msu', function()
  vim.cmd 'normal! zug'
end, { desc = '[P]Spelling undo, remove word from list' })

vim.keymap.set('n', '<leader>msr', function()
  -- vim.cmd(":spellr")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':spellr\n', true, false, true), 'm', true)
end, { desc = '[P]Spelling repeat' })

vim.keymap.set('n', '<leader>fcp', function()
  local filePath = vim.fn.expand '%:~' -- Gets the file path relative to the home directory
  vim.fn.setreg('+', filePath) -- Copy the file path to the clipboard register
  print('File path copied to clipboard: ' .. filePath) -- Optional: print message to confirm
end, { desc = '[P]Copy file path to clipboard' })

local function set_foldmethod_expr()
  -- These are lazyvim.org defaults but setting them just in case a file
  -- doesn't have them set
  if vim.fn.has 'nvim-0.10' == 1 then
    vim.opt.foldmethod = 'expr'
    -- Replace the foldexpr and foldtext with your own implementations or defaults
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  -- vim.opt.foldtext = "getline(v:foldstart).' ... ' . getline(v:foldend)"
  else
    vim.opt.foldmethod = 'indent'
    -- vim.opt.foldtext = "getline(v:foldstart).' ... ' . getline(v:foldend)"
  end
  vim.opt.foldlevel = 99
end

local function fold_headings_of_level(level)
  -- Move to the top of the file
  vim.cmd 'normal! gg'
  -- Get the total number of lines
  local total_lines = vim.fn.line '$'
  for line = 1, total_lines do
    -- Get the content of the current line
    local line_content = vim.fn.getline(line)
    -- "^" -> Ensures the match is at the start of the line
    -- string.rep("#", level) -> Creates a string with 'level' number of "#" characters
    -- "%s" -> Matches any whitespace character after the "#" characters
    -- So this will match `## `, `### `, `#### ` for example, which are markdown headings
    if line_content:match('^' .. string.rep('#', level) .. '%s') then
      -- Move the cursor to the current line
      vim.fn.cursor(line, 1)
      -- Fold the heading if it matches the level
      if vim.fn.foldclosed(line) == -1 then
        vim.cmd 'normal! za'
      end
    end
  end
end

local function fold_markdown_headings(levels)
  set_foldmethod_expr()
  -- I save the view to know where to jump back after folding
  local saved_view = vim.fn.winsaveview()
  for _, level in ipairs(levels) do
    fold_headings_of_level(level)
  end
  vim.cmd 'nohlsearch'
  -- Restore the view to jump to where I was
  vim.fn.winrestview(saved_view)
end

-- Keymap for unfolding markdown headings of level 2 or above
-- vim.keymap.set('n', '<leader>mfu', function()
--   -- Reloads the file to reflect the changes
--   vim.cmd 'edit!'
--   vim.cmd 'normal! zR' -- Unfold all headings
-- end, { desc = '[P]Unfold all headings level 2 or above' })

vim.keymap.set('n', '<leader>mfu', function()
  vim.cmd 'edit!'
  vim.cmd 'normal! zR' -- Unfold all headings
end, { desc = '[P]Unfold all headings level 2 or above' })

-- Keymap for folding markdown headings of level 1 or above
vim.keymap.set('n', '<leader>mfj', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4, 3, 2, 1 }
end, { desc = '[P]Fold all headings level 1 or above' })

-- Keymap for folding markdown headings of level 2 or above
-- I know, it reads like "madafaka" but "k" for me means "2"
vim.keymap.set('n', '<leader>mfk', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4, 3, 2 }
end, { desc = '[P]Fold all headings level 2 or above' })

-- Keymap for folding markdown headings of level 3 or above
vim.keymap.set('n', '<leader>mfl', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4, 3 }
end, { desc = '[P]Fold all headings level 3 or above' })

-- Keymap for folding markdown headings of level 4 or above
vim.keymap.set('n', '<leader>mf;', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4 }
end, { desc = '[P]Fold all headings level 4 or above' })

-- Define a custom fold text function
local function custom_foldtext()
  -- Get the start and end lines of the fold
  local start_line = vim.v.foldstart

  -- Get the content of the start line
  local start_line_content = vim.fn.getline(start_line)

  -- Extract the heading text (assuming headings start with #)
  local function extract_heading(content)
    -- Match headings and capture the text after the # characters
    local heading = content:match '^(#+)%s*(.*)'
    return heading or content
  end

  -- Format the fold text to show only the heading
  local fold_text = extract_heading(start_line_content)

  return fold_text
end

-- Set the fold text to use the custom function
vim.opt.foldtext = custom_foldtext()

-- vim.keymap.set({ 'n', 'i' }, '<M-y>', function()
--   local pasted_image = require('img-clip').paste_image()
--   if pasted_image then
--     -- "Update" saves only if the buffer has been modified since the last save
--     vim.cmd 'silent! update'
--     -- Get the current line
--     local line = vim.api.nvim_get_current_line()
--     -- Move cursor to end of line
--     vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], #line })
--     -- I reload the file, otherwise I cannot view the image after pasted
--     vim.cmd 'edit!'
--   end
-- end, { desc = '[P]Paste image from system clipboard' })
--
-------------------------------------------------------------------------------
--                       Assets directory
-------------------------------------------------------------------------------

-- NOTE: Configuration for image storage path
-- Change this to customize where images are stored relative to the assets directory
-- If below you use "img/imgs", it will store in "assets/img/imgs"
local IMAGE_STORAGE_PATH = 'img/imgs'

-- This function is used in 2 places in the paste images in assets dir section
-- finds the assets/img/imgs directory going one dir at a time and returns the full path
local function find_assets_dir()
  local dir = vim.fn.expand '%:p:h'
  while dir ~= '/' do
    local full_path = dir .. '/assets/' .. IMAGE_STORAGE_PATH
    if vim.fn.isdirectory(full_path) == 1 then
      return full_path
    end
    dir = vim.fn.fnamemodify(dir, ':h')
  end
  return nil
end

-- Since I need to store these images in a different directory, I pass the options to img-clip
local function handle_image_paste(img_dir)
  local function paste_image(dir_path, file_name)
    return require('img-clip').paste_image {
      dir_path = dir_path,
      use_absolute_path = false,
      relative_to_current_file = false,
      file_name = file_name,
      extension = 'avif',
      process_cmd = 'convert - -quality 75 avif:-',
    }
  end
  local temp_buf = vim.api.nvim_create_buf(false, true) -- Create an unlisted, scratch buffer
  vim.api.nvim_set_current_buf(temp_buf) -- Switch to the temporary buffer
  local temp_image_path = vim.fn.tempname() .. '.avif'
  local image_pasted = paste_image(vim.fn.fnamemodify(temp_image_path, ':h'), vim.fn.fnamemodify(temp_image_path, ':t:r'))
  vim.api.nvim_buf_delete(temp_buf, { force = true }) -- Delete the buffer
  vim.fn.delete(temp_image_path) -- Delete the temporary file
  vim.defer_fn(function()
    local options = image_pasted and { 'no', 'yes', 'search' } or { 'search' }
    local prompt = image_pasted and 'Is this a thumbnail image? ' or 'No image in clipboard. Select search to continue.'
    -- -- I was getting a character in the textbox, don't want to debug right now
    -- vim.cmd("stopinsert")
    vim.ui.select(options, { prompt = prompt }, function(is_thumbnail)
      if is_thumbnail == 'search' then
        local assets_dir = find_assets_dir()
        -- Get the parent directory of the current file
        local current_dir = vim.fn.expand '%:p:h'
        -- Get the parent directory of assets_dir (removing /img/imgs)
        local base_assets_dir = vim.fn.fnamemodify(assets_dir, ':h:h:h')
        -- Count how many levels we need to go up
        local levels = 0
        local temp_dir = current_dir
        while temp_dir ~= base_assets_dir and temp_dir ~= '/' do
          levels = levels + 1
          temp_dir = vim.fn.fnamemodify(temp_dir, ':h')
        end
        -- Build the relative path
        local relative_path = levels == 0 and './assets/' .. IMAGE_STORAGE_PATH or string.rep('../', levels) .. 'assets/' .. IMAGE_STORAGE_PATH
        vim.api.nvim_put({ '![Image](' .. relative_path .. '){: width="500" }' }, 'c', true, true)
        -- Capital "O" to move to the line above
        vim.cmd 'normal! O'
        -- This "o" is to leave a blank line above
        vim.cmd 'normal! o'
        vim.api.nvim_put({ '<!-- prettier-ignore -->' }, 'c', true, true)
        vim.cmd 'normal! jo'
        vim.api.nvim_put({ '_textimage_', '' }, 'c', true, true)
        -- find image path and add a / at the end of it
        vim.cmd 'normal! kkf)i/'
        -- Move one to the right and enter insert mode
        vim.cmd 'normal! la'
        -- -- This puts me in insert mode where the cursor is
        -- vim.api.nvim_feedkeys("i", "n", true)
        return
      end
      if not is_thumbnail then
        print 'Image pasting canceled.'
        return
      end
      local prefix = vim.fn.strftime '%y%m%d-' .. (is_thumbnail == 'yes' and 'thux-' or '')
      local function prompt_for_name()
        vim.ui.input({ prompt = 'Enter image name (no spaces). Added prefix: ' .. prefix }, function(input_name)
          if not input_name or input_name:match '%s' then
            print 'Invalid image name or canceled. Image not pasted.'
            return
          end
          local full_image_name = prefix .. input_name
          local file_path = img_dir .. '/' .. full_image_name .. '.avif'
          if vim.fn.filereadable(file_path) == 1 then
            print 'Image name already exists. Please enter a new name.'
            prompt_for_name()
          else
            if paste_image(img_dir, full_image_name) then
              -- -- I was getting a character at the end, don't want to debug right now
              -- vim.cmd("stopinsert")
              vim.api.nvim_put({ '{: width="500" }' }, 'c', true, true)
              -- Capital "O" to move to the line above
              vim.cmd 'normal! O'
              -- This "o" is to leave a blank line above
              vim.cmd 'normal! o'
              vim.api.nvim_put({ '<!-- prettier-ignore -->' }, 'c', true, true)
              vim.cmd 'normal! jo'
              vim.api.nvim_put({ '__' }, 'c', true, true)
              -- "Update" saves only if the buffer has been modified since the last save
              vim.cmd 'silent! update'
              -- I reload the file, otherwise I cannot view the image after pasted
              vim.cmd 'edit!'
              vim.cmd 'normal! h'
            else
              print 'No image pasted. File not updated.'
            end
          end
        end)
      end
      prompt_for_name()
    end)
  end, 100)
end

local function process_image()
  local img_dir = find_assets_dir()
  if not img_dir then
    vim.ui.select({ 'yes', 'no' }, {
      prompt = IMAGE_STORAGE_PATH .. ' directory not found. Create it?',
      default = 'yes',
    }, function(choice)
      if choice == 'yes' then
        img_dir = vim.fn.getcwd() .. '/assets/' .. IMAGE_STORAGE_PATH
        vim.fn.mkdir(img_dir, 'p')
        -- Start the image paste process after creating directory
        vim.defer_fn(function()
          handle_image_paste(img_dir)
        end, 100)
      else
        print 'Operation cancelled - directory not created'
        return
      end
    end)
    return
  end
  handle_image_paste(img_dir)
end

-- Keymap to paste images in the 'assets' directory
-- This pastes images for my blogpost, I need to keep them in a different directory
-- so I pass those options to img-clip
vim.keymap.set({ 'n', 'i' }, '<M-y>', process_image, { desc = "[P]Paste image 'assets' directory" })


vim.keymap.set("n", "<leader>io", function()
  local function get_image_path()
    -- Get the current line
    local line = vim.api.nvim_get_current_line()
    -- Pattern to match image path in Markdown
    local image_pattern = "%[.-%]%((.-)%)"
    -- Extract relative image path
    local _, _, image_path = string.find(line, image_pattern)
    return image_path
  end
  -- Get the image path
  local image_path = get_image_path()
  if image_path then
    -- Check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == "http" then
      print("URL image, use 'gx' to open it in the default browser.")
    else
      -- Construct absolute image path
      local current_file_path = vim.fn.expand("%:p:h")
      local absolute_image_path = current_file_path .. "/" .. image_path
      -- Construct command to open image in Preview
      local command = "open -a Preview " .. vim.fn.shellescape(absolute_image_path)
      -- Execute the command
      local success = os.execute(command)
      if success then
        print("Opened image in Preview: " .. absolute_image_path)
      else
        print("Failed to open image in Preview: " .. absolute_image_path)
      end
    end
  else
    print("No image found under the cursor")
  end
end, { desc = "[P](macOS) Open image under cursor in Preview" })

-- ############################################################################

-- HACK: Upload images from Neovim to Imgur
-- https://youtu.be/Lzl_0SzbUBo
--
-- Open image under cursor in Finder (macOS)
--
-- THIS ONLY WORKS IF YOU'RE NNNNNOOOOOOTTTTT USING ABSOLUTE PATHS,
-- BUT INSTEAD YOURE USING RELATIVE PATHS
--
-- If using absolute paths, use the default `gx` to open the image instead
vim.keymap.set("n", "<leader>if", function()
  local function get_image_path()
    -- Get the current line
    local line = vim.api.nvim_get_current_line()
    -- Pattern to match image path in Markdown
    local image_pattern = "%[.-%]%((.-)%)"
    -- Extract relative image path
    local _, _, image_path = string.find(line, image_pattern)
    return image_path
  end
  -- Get the image path
  local image_path = get_image_path()
  if image_path then
    -- Check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == "http" then
      print("URL image, use 'gx' to open it in the default browser.")
    else
      -- Construct absolute image path
      local current_file_path = vim.fn.expand("%:p:h")
      local absolute_image_path = current_file_path .. "/" .. image_path
      -- Open the containing folder in Finder and select the image file
      local command = "open -R " .. vim.fn.shellescape(absolute_image_path)
      local success = vim.fn.system(command)
      if success == 0 then
        print("Opened image in Finder: " .. absolute_image_path)
      else
        print("Failed to open image in Finder: " .. absolute_image_path)
      end
    end
  else
    print("No image found under the cursor")
  end
end, { desc = "[P](macOS) Open image under cursor in Finder" })

-- ############################################################################

-- HACK: Upload images from Neovim to Imgur
-- https://youtu.be/Lzl_0SzbUBo
--
-- Delete image file under cursor using trash app (macOS)
vim.keymap.set("n", "<leader>id", function()
  local function get_image_path()
    local line = vim.api.nvim_get_current_line()
    local image_pattern = "%[.-%]%((.-)%)"
    local _, _, image_path = string.find(line, image_pattern)
    return image_path
  end
  local image_path = get_image_path()
  if not image_path then
    vim.api.nvim_echo({ { "No image found under the cursor", "WarningMsg" } }, false, {})
    return
  end
  if string.sub(image_path, 1, 4) == "http" then
    vim.api.nvim_echo({ { "URL image cannot be deleted from disk.", "WarningMsg" } }, false, {})
    return
  end
  local current_file_path = vim.fn.expand("%:p:h")
  local absolute_image_path = current_file_path .. "/" .. image_path
  -- Check if file exists
  if vim.fn.filereadable(absolute_image_path) == 0 then
    vim.api.nvim_echo(
      { { "Image file does not exist:\n", "ErrorMsg" }, { absolute_image_path, "ErrorMsg" } },
      false,
      {}
    )
    return
  end
  if vim.fn.executable("trash") == 0 then
    vim.api.nvim_echo({
      { "- Trash utility not installed. Make sure to install it first\n", "ErrorMsg" },
      { "- In macOS run `brew install trash`\n", nil },
    }, false, {})
    return
  end
  -- Cannot see the popup as the cursor is on top of the image name, so saving
  -- its position, will move it to the top and then move it back
  local current_pos = vim.api.nvim_win_get_cursor(0) -- Save cursor position
  vim.api.nvim_win_set_cursor(0, { 1, 0 }) -- Move to top
  vim.ui.select({ "yes", "no" }, { prompt = "Delete image file? " }, function(choice)
    vim.api.nvim_win_set_cursor(0, current_pos) -- Move back to image line
    if choice == "yes" then
      local success, _ = pcall(function()
        vim.fn.system({ "trash", vim.fn.fnameescape(absolute_image_path) })
      end)
      -- Verify if file still exists after deletion attempt
      if success and vim.fn.filereadable(absolute_image_path) == 1 then
        -- Try with rm if trash deletion failed
        -- Keep in mind that if deleting with `rm` the images won't go to the
        -- macos trash app, they'll be gone
        -- This is useful in case trying to delete imaes mounted in a network
        -- drive, like for my blogpost lamw25wmal
        --
        -- Cannot see the popup as the cursor is on top of the image name, so saving
        -- its position, will move it to the top and then move it back
        current_pos = vim.api.nvim_win_get_cursor(0) -- Save cursor position
        vim.api.nvim_win_set_cursor(0, { 1, 0 }) -- Move to top
        vim.ui.select({ "yes", "no" }, { prompt = "Trash deletion failed. Try with rm command? " }, function(rm_choice)
          vim.api.nvim_win_set_cursor(0, current_pos) -- Move back to image line
          if rm_choice == "yes" then
            local rm_success, _ = pcall(function()
              vim.fn.system({ "rm", vim.fn.fnameescape(absolute_image_path) })
            end)
            if rm_success and vim.fn.filereadable(absolute_image_path) == 0 then
              vim.api.nvim_echo({
                { "Image file deleted from disk using rm:\n", "Normal" },
                { absolute_image_path, "Normal" },
              }, false, {})
              require("image").clear()
              vim.cmd("edit!")
              vim.cmd("normal! dd")
            else
              vim.api.nvim_echo({
                { "Failed to delete image file with rm:\n", "ErrorMsg" },
                { absolute_image_path, "ErrorMsg" },
              }, false, {})
            end
          end
        end)
      elseif success and vim.fn.filereadable(absolute_image_path) == 0 then
        vim.api.nvim_echo({
          { "Image file deleted from disk:\n", "Normal" },
          { absolute_image_path, "Normal" },
        }, false, {})
        require("image").clear()
        vim.cmd("edit!")
        vim.cmd("normal! dd")
      else
        vim.api.nvim_echo({
          { "Failed to delete image file:\n", "ErrorMsg" },
          { absolute_image_path, "ErrorMsg" },
        }, false, {})
      end
    else
      vim.api.nvim_echo({ { "Image deletion canceled.", "Normal" } }, false, {})
    end
  end)
end, { desc = "[P](macOS) Delete image file under cursor" })
