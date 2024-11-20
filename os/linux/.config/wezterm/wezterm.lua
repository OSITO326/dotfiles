local wezterm = require("wezterm")
local keybinds = require("keybinds")
local mouse_bindings = require("mouse_bindings")
local font_rules = require("font_rules")

return {
	animation_fps = 1,
	max_fps = 120,
	prefer_egl = true,
	color_scheme = "GruvboxDarkHard",
	colors = {
		background = "#1d2021",
		tab_bar = {
			background = "#1d2021",
			-- background = "rgba(0, 0, 0, 0%)",
			active_tab = {
				bg_color = "#3c3836",
				fg_color = "#b8bb26",
				intensity = "Normal", -- Normal | Half | Bold
				underline = "None", -- None | Single | Double
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = "#282828",
				fg_color = "#fabd2f",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab_hover = {
				bg_color = "#504945",
				fg_color = "#fe8019",
				italic = true,
			},
			new_tab = {
				-- bg_color = "rgba(59, 34, 76, 50%)",
				bg_color = "#32302f",
				fg_color = "#d3869b",
			},
			new_tab_hover = {
				bg_color = "#504945",
				fg_color = "#d3869b",
				italic = false,
			},
		},
	},
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,
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
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	-- initial_cols = 120,
	-- initial_rows = 80,
	initial_cols = 273,
	initial_rows = 160,
	keys = keybinds,
	-- line_height = 1.2,
	line_height = 1.1,
	mouse_bindings = mouse_bindings,
	set_environment_variables = {
		COLORTERM = "truecolor",
	},
	-- term = "xterm-256color",
	window_padding = {
		left = 5,
		right = 5,
		top = 0,
		bottom = 0,
	},
	warn_about_missing_glyphs = false,
	-- window_background_image = "/home/osito/Pictures/Wallpapers/Eva01-2.jpg",
	-- window_background_image_hsb = {
	-- 	brightness = 0.3,
	-- 	hue = 1.0,
	-- 	saturation = 1.0,
	-- },
}
