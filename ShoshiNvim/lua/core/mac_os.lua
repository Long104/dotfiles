vim.keymap.set({ 'n', 'v', 'i' }, '<c-a>', function()
  -- call the paste_image function from the lua api
  -- using the plugin's lua api (require("img-clip").paste_image()) instead of the
  -- pasteimage command because the lua api returns a boolean value indicating
  -- whether an image was pasted successfully or not.
  -- the pasteimage command does not
  -- https://github.com/hakonharnes/img-clip.nvim/blob/main/readme.md#api

  local pasted_image = require('img-clip').paste_image()
  if pasted_image then
    -- "update" saves only if the buffer has been modified since the last save
    vim.cmd 'update'
    print 'image pasted and file saved'
    -- only if updated i'll refresh the images by clearing them first
    -- i'm using [[ ]] to escape the special characters in a command
    vim.cmd [[lua require("image").clear()]]
    -- reloads the file to reflect the changes
    vim.cmd 'edit!'
    -- switch back to command mode or normal mode
    vim.cmd 'stopinsert'
  else
    print 'no image pasted. file not updated.'
  end
end, { desc = '[p]paste image from system clipboard' })

vim.keymap.set('n', '<leader>io', function()
  local function get_image_path()
    -- get the current line
    local line = vim.api.nvim_get_current_line()
    -- pattern to match image path in markdown
    local image_pattern = '%[.-%]%((.-)%)'
    -- extract relative image path
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end

  -- get the image path
  local image_path = get_image_path()

  if image_path then
    -- check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == 'http' then
      print "url image, use 'gx' to open it in the default browser."
    else
      -- construct absolute image path
      local current_file_path = vim.fn.expand '%:p:h'
      local absolute_image_path = current_file_path .. '/' .. image_path

      -- construct command to open image in preview
      local command = 'open -a preview ' .. vim.fn.shellescape(absolute_image_path)
      -- execute the command
      local success = os.execute(command)

      if success then
        print('opened image in preview: ' .. absolute_image_path)
      else
        print('failed to open image in preview: ' .. absolute_image_path)
      end
    end
  else
    print 'no image found under the cursor'
  end
end, { desc = '[p](macos) open image under cursor in preview' })

vim.keymap.set('n', '<leader>if', function()
  local function get_image_path()
    -- get the current line
    local line = vim.api.nvim_get_current_line()
    -- pattern to match image path in markdown
    local image_pattern = '%[.-%]%((.-)%)'
    -- extract relative image path
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end

  -- get the image path
  local image_path = get_image_path()

  if image_path then
    -- check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == 'http' then
      print "url image, use 'gx' to open it in the default browser."
    else
      -- construct absolute image path
      local current_file_path = vim.fn.expand '%:p:h'
      local absolute_image_path = current_file_path .. '/' .. image_path

      -- open the containing folder in finder and select the image file
      local command = 'open -r ' .. vim.fn.shellescape(absolute_image_path)
      local success = vim.fn.system(command)

      if success == 0 then
        print('opened image in finder: ' .. absolute_image_path)
      else
        print('failed to open image in finder: ' .. absolute_image_path)
      end
    end
  else
    print 'no image found under the cursor'
  end
end, { desc = '[p](macos) open image under cursor in finder' })

vim.keymap.set('n', '<leader>id', function()
  local function get_image_path()
    -- get the current line
    local line = vim.api.nvim_get_current_line()
    -- pattern to match image path in markdown
    local image_pattern = '%[.-%]%((.-)%)'
    -- extract relative image path
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end
  -- get the image path
  local image_path = get_image_path()
  if image_path then
    -- check if the image path starts with "http" or "https"
    if string.sub(image_path, 1, 4) == 'http' then
      vim.api.nvim_echo({
        { 'url image cannot be deleted from disk.', 'warningmsg' },
      }, false, {})
    else
      -- construct absolute image path
      local current_file_path = vim.fn.expand '%:p:h'
      local absolute_image_path = current_file_path .. '/' .. image_path
      -- check if trash utility is installed
      if vim.fn.executable 'trash' == 0 then
        vim.api.nvim_echo({
          { '- trash utility not installed. make sure to install it first\n', 'errormsg' },
          { '- in macos run `brew install trash`\n', nil },
        }, false, {})
        return
      end
      -- prompt for confirmation before deleting the image
      vim.ui.input({
        prompt = 'delete image file? (y/n) ',
      }, function(input)
        if input == 'y' or input == 'y' then
          -- delete the image file using trash app
          local success, _ = pcall(function()
            vim.fn.system { 'trash', vim.fn.fnameescape(absolute_image_path) }
          end)
          if success then
            vim.api.nvim_echo({
              { 'image file deleted from disk:\n', 'normal' },
              { absolute_image_path, 'normal' },
            }, false, {})
            -- i'll refresh the images, but will clear them first
            -- i'm using [[ ]] to escape the special characters in a command
            vim.cmd [[lua require("image").clear()]]
            -- reloads the file to reflect the changes
            vim.cmd 'edit!'
          else
            vim.api.nvim_echo({
              { 'failed to delete image file:\n', 'errormsg' },
              { absolute_image_path, 'errormsg' },
            }, false, {})
          end
        else
          vim.api.nvim_echo({
            { 'image deletion canceled.', 'normal' },
          }, false, {})
        end
      end)
    end
  else
    vim.api.nvim_echo({
      { 'no image found under the cursor', 'warningmsg' },
    }, false, {})
  end
end, { desc = '[p](macos) delete image file under cursor' })

vim.keymap.set('n', '<leader>ir', function()
  -- first i clear the images
  -- i'm using [[ ]] to escape the special characters in a command
  vim.cmd [[lua require("image").clear()]]
  -- reloads the file to reflect the changes
  vim.cmd 'edit!'
  print 'images refreshed'
end, { desc = '[p]refresh images' })

vim.keymap.set('n', '<leader>ic', function()
  -- this is the command that clears the images
  -- i'm using [[ ]] to escape the special characters in a command
  vim.cmd [[lua require("image").clear()]]
  print 'images cleared'
end, { desc = '[p]clear images' })
