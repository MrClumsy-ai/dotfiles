local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.warn_about_missing_glyphs = false
config.color_scheme = "Gruvbox dark, hard (base16)"
config.colors = { background = "black" }
config.font_size = 16
config.window_background_opacity = 0.6
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 400
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
config.keys({
	-- ctrl + backspace = delete word backwards
	{ key = "Backspace", mods = "CTRL", action = wezterm.action.SendString("\x17") },
})
config.font = wezterm.font("JetBrains Mono", {})
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)
return config
