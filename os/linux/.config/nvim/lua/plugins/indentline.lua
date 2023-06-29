return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
	  vim.cmd([[highlight IndentBlanklineIndent1 guifg=#FB4934 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent2 guifg=#FABD2F gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent3 guifg=#B8BB26 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent4 guifg=#83A598 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent5 guifg=#8EC07C gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent6 guifg=#D3869B gui=nocombine]])
		-- vim.opt.list = true
		require("indent_blankline").setup({
			show_end_of_line = true,
			space_char_blankline = " ",
			char_highlight_list = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			},
		})
	end,
}
