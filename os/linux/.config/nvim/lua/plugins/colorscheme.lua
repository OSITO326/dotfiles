return {
	"themercorp/themer.lua",
	lazy = false,
	priority = 1000,
	config = function()
		require("themer").setup({
			colorscheme = "onedark",
			styles = {
				["function"] = { style = "bold" },
				functionbuiltin = { style = "italic" },
				variableBuiltIn = { style = "italic" },
				parameter = { style = "italic" },
				["conditional"] = { style = "italic" },
				["keyword"] = { style = "italic" },
				["tag"] = { style = "bold" },
			},
			plugins = {
				treesitter = true,
				indentline = true,
				barbar = true,
				bufferline = true,
				cmp = true,
				gitsigns = true,
				lsp = true,
				telescope = true,
			},
		})
	end,
}
