local wezterm = require("wezterm")
-- local xdg_config_home = os.getenv("xdg_config_home")
local home = os.getenv("HOME")

local command = {
	brief = "Toggle terminal transparency",
	icon = "md_circle_transparent",
	action = wezterm.action_callback(function(window)
		local overrides = window:get_config_overrides() or {}

		if not overrides.window_background_opacity or overrides.window_background_opacity == 0.95 then
			overrides.window_background_opacity = 1
			-- overrides.window_background_image = home .. "/.config/wezterm/wallpaper/images.jpeg"
			overrides.window_background_image = home .. "/dotfiles/wallpaper/march.jpg"
		else
			overrides.window_background_opacity = 0.95
			overrides.window_background_image = ""
		end
		window:set_config_overrides(overrides)
	end),
}

return command
