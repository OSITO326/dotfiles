local cmd = vim.cmd
cmd("hi HopNextKey guifg=#FE8019")
cmd("hi HopNextKey1 guifg=#FE8019")
cmd("hi HopNextKey2 guifg=#FE8019")

return {
	"phaazon/hop.nvim",
	config = function()
		require("hop").setup({
			keys = "etovxqpdygfblzhckisuran",
		})
	end,
}
