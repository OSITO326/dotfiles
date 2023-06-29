return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		-- "nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-refactor",
		"p00f/nvim-ts-rainbow", -- no longer maintained
		"windwp/nvim-ts-autotag",
		-- "windwp/nvim-autopairs",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"numToStr/Comment.nvim",
		"mbbill/undotree",
		"m4xshen/smartcolumn.nvim",
	},
	config = function()
		require("osito.nvim-treesitter")
	end,
}
