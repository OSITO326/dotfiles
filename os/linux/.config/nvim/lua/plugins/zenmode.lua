return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 100,
				options = {
					number = true,
					relativenumber = true,
				},
			},
		})
	end,
}
