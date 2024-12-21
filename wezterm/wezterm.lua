--- wezterm.lua
--- $ figlet -f small Wezterm
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_| My Wezterm config file
--
local wezterm = require("wezterm")
-- local act = wezterm.acti
-- local xdg_config_home = os.getenv("xdg_config_home") local dimmer = { brightness = 0.1 }
-- local fish_path = "/opt/homebrew/bin/fish"
-- local fish_path = "/Users/zen/.nix-profile/bin/fish"

-- local fish_path = "/usr/bin/fish"
-- local fish_path = "/bin/bash"
local zsh_path = "/bin/zsh"

local config = {}
-- Use config builder object if possible if wezterm.config_builder then config = wezterm.config_builder()
-- end

local k = require("utils/keys")
-- config.font = wezterm.font("JetBrains Mono",{weight="Medium",scale=1.5})

config.font = wezterm.font_with_fallback({
	-- { family = "JetBrains Mono", weight = "Medium" },
	{ family = "JetBrains Mono", weight = "Bold" },
	-- { family = "Fira Code", weight = "Bold" },
	{
		family = "MesloLGS Nerd Font Mono",
		weight = "Thin",
		scale = 1.0,
	},

	-- { family = "Fira Code", weight = "Regular" },
	-- { family = "Hack", weight = "Regular" },
	-- { family = "DejaVu Sans Mono", weight = "Book" },
	-- { family = "Droid Sans Mono", weight = "Regular" },
	-- { family = "Noto Sans Mono", weight = "Regular" },
	-- { family = "Source Code Pro", weight = "Regular" },
	-- { family = "Ubuntu Mono", weight = "Regular" },
	-- { family = "Terminus", weight = "Regular" },
	-- { family = "Terminus", weight = "Bold" },
	-- "Noto Color Emoji",
})

--background
-- if dimmer.brightness == 1 then
-- 	config.background = {
-- 		-- This is the deepest/back-most layer. It will be rendered first
-- 		{
-- 			source = {
-- 				-- File = xdg_config_home .. "/wezterm/wallpaper/images.jpeg",
-- 				File = wezterm.config_dir .. "/wallpaper/images.jpeg",
-- File = "/Users/pantorn/.config/wezterm/wallpaper/images.jpeg",
-- 			},
-- 			-- The texture tiles vertically but not horizontally.
-- 			-- When we repeat it, mirror it so that it appears "more seamless".
-- 			-- An alternative to this is to set `width = "100%"` and have
-- 			-- it stretch across the display
-- 			-- repeat_x = "Mirror",
-- 			hsb = dimmer,
-- 			-- When the viewport scrolls, move this layer 10% of the number of
-- 			-- pixels moved by the main viewport. This makes it appear to be
-- 			-- further behind the text.
-- 			-- attachment = { Parallax = 0.1 },
-- 		},
-- 	}
-- else
-- end
-- config.font = wezterm.font("MesloLGS Nerd Font", { weight = "Regular", italic = false})
-- config.font = wezterm.font("MesloLGS Nerd Font", { weight = "Classic Console Neue" })
config.warn_about_missing_glyphs = false
config.freetype_load_flags = "NO_HINTING"
config.enable_wayland = false
config.font_size = 13.5
config.enable_kitty_graphics = true
-- config.underline_thickness = "1.5pt"
-- config.underline_position = "-3.2pt"
-- config.freetype_load_target = "Light"
config.freetype_load_target = "HorizontalLcd"
config.initial_rows = 52
config.initial_cols = 230
-- config.scroll_to_bottom_on_input = true
config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9
-- Settings
config.default_prog = { zsh_path, "-l" }
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "kanagawabones"
-- config.color_scheme = "nord"
-- config.color_scheme = "nordfox"
-- config.color_scheme = 'Nord (Gogh)'
-- config.color_scheme = 'Nord (base16)'
config.window_background_opacity = 0.95
-- config.window_background_opacity = 0.9
-- config.window_background_image = wezterm.config_dir .. "/wallpaper/images.jpeg"
-- config.window_background_image = wezterm.config_dir .. "/wallpaper/patapata.gif"
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

--[[ Appearance setting for when I need to take pretty screenshots
config.enable_tab_bar = false
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell',

}
--]]

-- config.colors = {
-- 	tab_bar = {
-- 		-- Setting the bar color to black
-- 		background = "rgba(0,0,0,0)",
-- 	},
-- }
config.hide_tab_bar_if_only_one_tab = true
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
-- config.status_update_interval = 1000
config.tab_bar_at_bottom = false
config.window_close_confirmation = "NeverPrompt"
-- config.enable_tab_bar = false

config.keys = {
	-- k.cmd_to_tmux_prefix("y", "T"),
	-- k.cmd_to_tmux_prefix("y", "y"),
	k.cmd_to_tmux_prefix("K", "T"),
	k.cmd_to_tmux_prefix("k", "K"),
	k.cmd_to_tmux_prefix("O", "T"),
	k.cmd_to_tmux_prefix("o", "O"),
	k.cmd_to_tmux_prefix("x", "T"),
	k.cmd_to_tmux_prefix("x", "x"),
	-- k.cmd_to_tmux_prefix("c", "T"),
	-- k.cmd_to_tmux_prefix("c", "c"),
	-- k.cmd_to_tmux_prefix("r", "T"),
	-- k.cmd_to_tmux_prefix("r", "r"),
	-- k.cmd_to_tmux_prefix("d", "T"),
	-- k.cmd_to_tmux_prefix("d", "d"),
	-- k.cmd_to_tmux_prefix("s", "T"),
	-- k.cmd_to_tmux_prefix("s", "s"),
	k.cmd_to_tmux_prefix("a", "T"),
	k.cmd_to_tmux_prefix("a", "m"),
	k.cmd_to_tmux_prefix("p", "T"),
	k.cmd_to_tmux_prefix("p", "p"),
	k.cmd_to_tmux_prefix("n", "T"),
	k.cmd_to_tmux_prefix("n", "n"),
	k.cmd_to_tmux_prefix("u", "T"),
	k.cmd_to_tmux_prefix("u", "u"),
	k.cmd_to_tmux_prefix("i", "T"),
	k.cmd_to_tmux_prefix("i", "i"),
	k.cmd_to_tmux_prefix("m", "T"),
	k.cmd_to_tmux_prefix("m", "m"),
	k.cmd_to_tmux_prefix("l", "T"),
	k.cmd_to_tmux_prefix("l", "L"),
	k.cmd_to_tmux_prefix("j", "T"),
	k.cmd_to_tmux_prefix("j", "j"),
	k.cmd_to_tmux_prefix("H", "T"),
	k.cmd_to_tmux_prefix("h", "H"),
	k.cmd_to_tmux_prefix("$", "T"),
	k.cmd_to_tmux_prefix("4", "$"),
}

-- The art is a bit too bright and colorful to be useful as a backdrop
-- for text, so we're going to dim it down to 10% of its normal brightness

-- config.enable_scroll_bar = true
-- config.min_scroll_bar_height = "2cell"
-- config.colors = {
-- scrollbar_thumb = "white",
-- }
-- if nvim is at foreground:
--   close nvim buffer
-- else:
--   close terminal
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)
return config
