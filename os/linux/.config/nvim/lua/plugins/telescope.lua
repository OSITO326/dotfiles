return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-hop.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
		require("osito.telescope.setup")
	end,
}
