return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify").notify
		-- vim.notify("Neovim start!", "info", { title = "Welcome" })
		local banned_messages = { "No information available" }
		vim.notify = function(msg, ...)
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end
			require("notify")(msg, ...)
		end

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
	end,
}
