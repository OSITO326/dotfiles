return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
	},
	keys = {
		{ "<leader><leader>db", ":tab DBUI<cr>", desc = "DBUI" },
	},
	init = function()
		require("osito.database")
	end,
}
