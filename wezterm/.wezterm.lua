local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.warn_about_missing_glyphs = false
config.color_scheme = "Gruvbox dark, hard (base16)"
config.colors = { background = "black" }
config.font_size = 16
config.window_background_opacity = 0.8
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.keys = {
	-- ctrl + backspace = delete word backwards
	{ key = "Backspace", mods = "CTRL", action = wezterm.action.SendString("\x17") },
}
config.font = wezterm.font("JetBrains Mono", {})
wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)
return config
