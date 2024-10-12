local wezterm = require("wezterm")
local action = wezterm.action

return {
	-- New Tab
	{
		key = "n",
		mods = "ALT",
		action = action.SpawnTab("DefaultDomain"),
	},
	-- Move between tabs
	{
		key = "h",
		mods = "ALT",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "ALT",
		action = action.ActivateTabRelative(1),
	},
	-- Split Horizontally
	{
		-- key = "d",
		-- mods = "CTRL|SHIFT",
		key = "-",
		mods = "ALT",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Split Vertically
	{
		-- key = "e",
		-- mods = "CTRL|SHIFT",
		key = "\\",
		mods = "ALT",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Close current panel
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = action.CloseCurrentPane({ confirm = true }),
	},
	-- Resize panels
	{
		-- key = "h",
		-- mods = "CTRL|ALT",
		key = "H",
		mods = "ALT",
		action = action.AdjustPaneSize({ "Left", 2 }),
	},
	{
		-- key = "j",
		-- mods = "CTRL|ALT",
		key = "J",
		mods = "ALT",
		action = action.AdjustPaneSize({ "Down", 1 }),
	},
	{
		-- key = "k",
		-- mods = "CTRL|ALT",
		key = "K",
		mods = "ALT",
		action = action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		-- key = "l",
		-- mods = "CTRL|ALT",
		key = "L",
		mods = "ALT",
		action = action.AdjustPaneSize({ "Right", 2 }),
	},
	-- Navigations panel hjkl vim keys
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = action.ActivatePaneDirection("Right"),
	},
}
