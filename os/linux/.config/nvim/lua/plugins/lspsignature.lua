return {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			debug = true,
			hint_enable = true,
			handler_opts = { border = "single" },
			max_width = 80,
			hint_prefix = "🤔 ",
		})
	end,
}
