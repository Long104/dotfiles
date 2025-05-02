local wezterm = require("wezterm")
-- local xdg_config_home = os.getenv("xdg_config_home")
local dimmer = { brightness = 0.1 }
local zsh_path = "/bin/zsh"

local config = {}

config.font = wezterm.font_with_fallback({
	-- { family = "JetBrains Mono", weight = "Medium" },
	{ family = "JetBrains Mono", weight = "Bold" },
	-- { family = "JetBrains Mono", weight = "Regular" },
})

config.max_fps = 120
config.prefer_egl = true
config.warn_about_missing_glyphs = false
config.freetype_load_flags = "NO_HINTING"
config.enable_wayland = false
config.font_size = 14
config.enable_kitty_graphics = true
config.freetype_load_target = "HorizontalLcd"
config.initial_rows = 52
config.initial_cols = 230
-- config.scroll_to_bottom_on_input = true
config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9
-- Settings
config.default_prog = { zsh_path, "-l" }
config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "kanagawabones"
config.window_background_opacity = 0.00
-- config.window_background_image = wezterm.config_dir .. "/wallpaper/images.jpeg"
-- config.window_background_image_hsb = { brightness = 0.01 }
config.send_composed_key_when_left_alt_is_pressed = true
config.macos_window_background_blur = 13
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

config.window_padding = {
	left = 10,
	right = 10,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
-- config.status_update_interval = 1000
config.tab_bar_at_bottom = false
config.window_close_confirmation = "NeverPrompt"
-- config.enable_tab_bar = false

return config
