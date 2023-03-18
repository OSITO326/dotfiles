return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#1d2021",
			fps = 60,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 500,
			--timeout = 1500,
		})
		--vim.notify = require("notify").notify
		--vim.notify("Neovim start!", "info", { title = "Welcome" })
	end,
}
