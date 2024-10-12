local wezterm = require("wezterm")
local keybinds = require("keybinds")
local mouse_bindings = require("mouse_bindings")
local font_rules = require("font_rules")

return {
	color_scheme = "GruvboxDarkHard",
	colors = {
		background = "#1d2021",
	},
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	default_cursor_style = "BlinkingBlock",
	disable_default_key_bindings = false,
	font = wezterm.font_with_fallback({
		-- {
		-- 	family = "Operator Mono",
		-- 	weight = "Medium",
		-- 	stretch = "ExtraExpanded",
		-- },
		{
			family = "Cascadia Code",
			weight = "Medium",
			stretch = "Expanded",
		},
		{
			family = "JetBrainsMono Nerd Font Mono",
			weight = "Medium",
			stretch = "Expanded",
		},
	}),
	font_rules = font_rules,
	font_size = 11,
	hide_tab_bar_if_only_one_tab = true,
	initial_cols = 120,
	initial_rows = 40,
	keys = keybinds,
	-- line_height = 1.2,
	line_height = 1.1,
	mouse_bindings = mouse_bindings,
	set_environment_variables = {
		COLORTERM = "truecolor",
	},
	window_padding = {
		left = 5,
		right = 5,
		top = 0,
		bottom = 0,
	},
	-- window_background_image = "/home/osito/Pictures/Wallpapers/Eva01-2.jpg",
	-- window_background_image_hsb = {
	-- 	brightness = 0.3,
	-- 	hue = 1.0,
	-- 	saturation = 1.0,
	-- },
}
