local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.font_size = 17

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.87
config.macos_window_background_blur = 10

config.colors = {
	background = "#131313",
	cursor_bg = "rgba(235, 235, 235, 0.7)",
}

config.default_cursor_style = "SteadyBar"

config.cursor_thickness = 2

return config
