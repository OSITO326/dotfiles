return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-refactor",
		"p00f/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
		"windwp/nvim-autopairs",
		"preservim/nerdcommenter",
		"mbbill/undotree",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"dart",
				"dockerfile",
				"help",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"ninja",
				"php",
				"phpdoc",
				"python",
				"rust",
				"sql",
				"toml",
				"typescript",
				"vue",
				"yaml",
			},
			sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
			ignore_install = { "" }, -- List of parsers to ignore installing
			autopairs = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
			},
			indent = { enable = true, disable = { "yaml", "css", "python" } },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			refactor = {
				highlight_current_scope = { enable = true },
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = "grr",
					},
				},
			},
			rainbow = {
				disable = { "html", "css" },
				enable = true,
				extended_mode = false,
				max_file_lines = nil,
				--colors = { "#ebdbb2", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c" },
				colors = { "#fb4934", "#fabd2f", "#b8bb26", "#83a598", "#8ec07c", "#d3869b", "#fe8019" },
			},
		})
	end,
}
