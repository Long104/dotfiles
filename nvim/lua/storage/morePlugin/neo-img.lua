
return {
  "skardyy/neo-img",
  config = function()
    require("neo-img").setup {
      supported_extensions = {
        ["png"] = true,
        ["jpg"] = true,
        ["jpeg"] = true,
        ["webp"] = true,
        ["svg"] = true,
        ["tiff"] = true,
      },
      auto_open = true, -- Automatically open images when buffer is loaded
      oil_preview = true, -- changes oil preview of images too
      backend = "auto", -- auto detect: kitty / iterm / sixel
      size = { --scales the width, will maintain aspect ratio
        oil = { x = 400, y = 400 }, -- a number (oil = 400) will set both at once
        main = { x = 800, y = 800 },
      },
      offset = {
        oil = { x = 5, y = 3 }, -- a number will only change the x
        main = { x = 10, y = 3 },
      },
      resizeMode = "Fit", -- Fit / Strech / Crop
    }
  end,
}
