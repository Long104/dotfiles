return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {{
   mode = "n",
    "<leader>db",
    ":lua require('dbee').toggle()<CR>",
  }},
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup(--[[optional config]])
  end,
}

-- -- Open/close/toggle the UI.
-- require("dbee").open()
-- require("dbee").close()
-- require("dbee").toggle()
-- -- Run a query on the currently active connection.
-- require("dbee").execute(query)
-- -- Store the current result to file/buffer/yank-register (see "Getting Started").
-- require("dbee").store(format, output, opts)
