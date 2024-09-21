return {
  "vinnymeller/swagger-preview.nvim",
  build = "npm install -g swagger-ui-watcher",
  keys = {{
mode = "n","<leader>sw","<cmd>SwaggerPreviewToggle<cr>",desc = "Swagger Preview",
  }},
  config = function ()
    require("swagger-preview").setup({
    -- The port to run the preview server on
    port = 6000,
    -- The host to run the preview server on
    host = "localhost",
})
  end
}
-- :SwaggerPreview - starts a new preview, killing any preexisting server
-- :SwaggerPreviewStop - stops the curent server
-- :SwaggerPreviewToggle - turns preview on if it was off, kills it if it was on
