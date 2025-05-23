vim.keymap.set("n", "<leader>tx", function()
  -- vim.keymap.set('n', '<leader>tx', function()
  -- Customizable variables
  -- NOTE: Customize the completion label
  local label_done = "done:"
  -- NOTE: Customize the timestamp format
  local timestamp = os.date "%y%m%d-%H%M"
  -- local timestamp = os.date("%y%m%d")
  -- NOTE: Customize the heading and its level
  local tasks_heading = "## Completed tasks"
  -- Save the view to preserve folds
  vim.cmd "mkview"
  local api = vim.api
  -- Retrieve buffer & lines
  local buf = api.nvim_get_current_buf()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local start_line = cursor_pos[1] - 1
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local total_lines = #lines
  -- If cursor is beyond last line, do nothing
  if start_line >= total_lines then
    return
  end
  ------------------------------------------------------------------------------
  -- (A) Move upwards to find the bullet line (if user is somewhere in the chunk)
  ------------------------------------------------------------------------------
  while start_line > 0 do
    local line_text = lines[start_line + 1]
    -- Stop if we find a blank line or a bullet line
    if line_text == "" or line_text:match "^%s*%-" then
      break
    end
    start_line = start_line - 1
  end
  -- Now we might be on a blank line or a bullet line
  if lines[start_line + 1] == "" and start_line < (total_lines - 1) then
    start_line = start_line + 1
  end
  ------------------------------------------------------------------------------
  -- (B) Validate that it's actually a task bullet, i.e. '- [ ]' or '- [x]'
  ------------------------------------------------------------------------------
  local bullet_line = lines[start_line + 1]
  if not bullet_line:match "^%s*%- %[[x ]%]" then
    -- Not a task bullet => show a message and return
    print "Not a task bullet: no action taken."
    return
  end
  ------------------------------------------------------------------------------
  -- 1. Identify the chunk boundaries
  ------------------------------------------------------------------------------
  local chunk_start = start_line
  local chunk_end = start_line
  while chunk_end + 1 < total_lines do
    local next_line = lines[chunk_end + 2]
    if next_line == "" or next_line:match "^%s*%-" then
      break
    end
    chunk_end = chunk_end + 1
  end
  -- Collect the chunk lines
  local chunk = {}
  for i = chunk_start, chunk_end do
    table.insert(chunk, lines[i + 1])
  end
  ------------------------------------------------------------------------------
  -- 2. Check if chunk has [done: ...] or [untoggled], then transform them
  ------------------------------------------------------------------------------
  local has_done_index = nil
  local has_untoggled_index = nil
  for i, line in ipairs(chunk) do
    -- Replace `[done: ...]` -> `` `done: ...` ``
    chunk[i] = line:gsub("%[done:([^%]]+)%]", "`" .. label_done .. "%1`")
    -- Replace `[untoggled]` -> `` `untoggled` ``
    chunk[i] = chunk[i]:gsub("%[untoggled%]", "`untoggled`")
    if chunk[i]:match("`" .. label_done .. ".-`") then
      has_done_index = i
      break
    end
  end
  if not has_done_index then
    for i, line in ipairs(chunk) do
      if line:match "`untoggled`" then
        has_untoggled_index = i
        break
      end
    end
  end
  ------------------------------------------------------------------------------
  -- 3. Helpers to toggle bullet
  ------------------------------------------------------------------------------
  -- Convert '- [ ]' to '- [x]'
  local function bulletToX(line)
    return line:gsub("^(%s*%- )%[%s*%]", "%1[x]")
  end
  -- Convert '- [x]' to '- [ ]'
  local function bulletToBlank(line)
    return line:gsub("^(%s*%- )%[x%]", "%1[ ]")
  end
  ------------------------------------------------------------------------------
  -- 4. Insert or remove label *after* the bracket
  ------------------------------------------------------------------------------
  local function insertLabelAfterBracket(line, label)
    local prefix = line:match "^(%s*%- %[[x ]%])"
    if not prefix then
      return line
    end
    local rest = line:sub(#prefix + 1)
    return prefix .. " " .. label .. rest
  end
  local function removeLabel(line)
    -- If there's a label (like `` `done: ...` `` or `` `untoggled` ``) right after
    -- '- [x]' or '- [ ]', remove it
    return line:gsub("^(%s*%- %[[x ]%])%s+`.-`", "%1")
  end
  ------------------------------------------------------------------------------
  -- 5. Update the buffer with new chunk lines (in place)
  ------------------------------------------------------------------------------
  local function updateBufferWithChunk(new_chunk)
    for idx = chunk_start, chunk_end do
      lines[idx + 1] = new_chunk[idx - chunk_start + 1]
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  end
  ------------------------------------------------------------------------------
  -- 6. Main toggle logic
  ------------------------------------------------------------------------------
  if has_done_index then
    chunk[has_done_index] = removeLabel(chunk[has_done_index]):gsub("`" .. label_done .. ".-`", "`untoggled`")
    chunk[1] = bulletToBlank(chunk[1])
    chunk[1] = removeLabel(chunk[1])
    chunk[1] = insertLabelAfterBracket(chunk[1], "`untoggled`")
    updateBufferWithChunk(chunk)
  elseif has_untoggled_index then
    chunk[has_untoggled_index] = removeLabel(chunk[has_untoggled_index]):gsub("`untoggled`", "`" .. label_done .. " " .. timestamp .. "`")
    chunk[1] = bulletToX(chunk[1])
    chunk[1] = removeLabel(chunk[1])
    chunk[1] = insertLabelAfterBracket(chunk[1], "`" .. label_done .. " " .. timestamp .. "`")
    updateBufferWithChunk(chunk)
  else
    chunk[1] = bulletToX(chunk[1])
    chunk[1] = insertLabelAfterBracket(chunk[1], "`" .. label_done .. " " .. timestamp .. "`")
    -- Remove chunk from the original lines
    for i = chunk_end, chunk_start, -1 do
      table.remove(lines, i + 1)
    end
    -- Append chunk under 'tasks_heading'
    local heading_index = nil
    for i, line in ipairs(lines) do
      if line:match("^" .. tasks_heading) then
        heading_index = i
        break
      end
    end
    if heading_index then
      for _, cLine in ipairs(chunk) do
        table.insert(lines, heading_index + 1, cLine)
        heading_index = heading_index + 1
      end
      -- Remove any blank line right after newly inserted chunk
      local after_last_item = heading_index + 1
      if lines[after_last_item] == "" then
        table.remove(lines, after_last_item)
      end
    else
      table.insert(lines, tasks_heading)
      for _, cLine in ipairs(chunk) do
        table.insert(lines, cLine)
      end
      local after_last_item = #lines + 1
      if lines[after_last_item] == "" then
        table.remove(lines, after_last_item)
      end
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  end
  -- Restore the view to preserve folds
  vim.cmd "loadview"
end, { desc = "[P]Toggle task and move it to 'done'" })

vim.keymap.set("n", "<leader>tt", function()
  require("telescope.builtin").grep_string(require("telescope.themes").get_ivy {
    prompt_title = "Incomplete Tasks",
    -- search = "- \\[ \\]", -- Fixed search term for tasks
    search = "^- \\[ \\]", -- Ensure "- [ ]" is at the beginning of the line
    search_dirs = { vim.fn.getcwd() }, -- Restrict search to the current working directory
    use_regex = true, -- Enable regex for the search term
    initial_mode = "normal", -- Start in normal mode
    layout_config = {
      preview_width = 0.5, -- Adjust preview width
    },
    additional_args = function()
      return { "--no-ignore" } -- Include files ignored by .gitignore
    end,
  })
end, { desc = "[P]Search for incomplete tasks" })

-- Iterate throuth completed tasks in telescope lamw25wmal
vim.keymap.set("n", "<leader>tc", function()
  require("telescope.builtin").grep_string(require("telescope.themes").get_ivy {
    prompt_title = "Completed Tasks",
    -- search = [[- \[x\] `done:]], -- Regex to match the text "`- [x] `done:"
    search = "^- \\[x\\] `done:", -- Matches lines starting with "- [x] `done:"
    search_dirs = { vim.fn.getcwd() }, -- Restrict search to the current working directory
    use_regex = true, -- Enable regex for the search term
    initial_mode = "normal", -- Start in normal mode
    layout_config = {
      preview_width = 0.5, -- Adjust preview width
    },
    additional_args = function()
      return { "--no-ignore" } -- Include files ignored by .gitignore
    end,
  })
end, { desc = "[P]Search for completed tasks" })

vim.keymap.set({ "n", "v" }, "gk", function()
  -- `?` - Start a search backwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd "silent! ?^##\\+\\s.*$"
  -- Clear the search highlight
  vim.cmd "nohlsearch"
end, { desc = "[P]Go to previous markdown header" })

vim.keymap.set({ "n", "v" }, "gj", function()
  -- `/` - Start a search forwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd "silent! /^##\\+\\s.*$"
  -- Clear the search highlight
  vim.cmd "nohlsearch"
end, { desc = "[P]Go to next markdown header" })
