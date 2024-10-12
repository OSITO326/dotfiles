local wezterm = require("wezterm")
local font = wezterm.font

return {
	-- https://wezfurlong.org/wezterm/config/lua/config/font_rules.html?h=font_rules
	-- NOTE:
	-- Para el grosor de la fuente:
	-- 100 para Thin
	-- 200 para ExtraLight
	-- 300 para Light
	-- 400 para Regular
	-- 500 para Medium
	-- 600 para SemiBold
	-- 700 para Bold
	-- 800 para ExtraBold
	-- NOTE:
	-- stretch -> controla que tan anche o estrecha aparece la fuente
	-- UltraCondensed
	-- ExtraCondensed
	-- Condensed
	-- SemiCondensed
	-- Normal
	-- SemiExpanded
	-- Expanded
	-- ExtraExpanded
	-- UltraExpanded

	{
		italic = true,
		intensity = "Normal",
		font = font({
			family = "Operator Mono",
			weight = 500,
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = font({
			family = "Cascadia Code",
			-- weight = 500,
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = font({
			family = "JetBrainsMono Nerd Font Mono",
			-- weight = 500,
			style = "Italic",
		}),
	},
}
