local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
	return
end

zen_mode.setup({
	window = {
		width = 100,
		options = {
			number = true,
			relativenumber = true,
		},
	},
})
