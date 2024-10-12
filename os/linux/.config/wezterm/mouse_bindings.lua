local wezterm = require("wezterm")

return {
	-- Paste with Right click
	{
		event = { Up = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action({
			PasteFrom = "PrimarySelection",
		}),
	},
}
