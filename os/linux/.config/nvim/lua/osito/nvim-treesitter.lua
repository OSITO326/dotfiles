local config = require("nvim-treesitter.configs")
local smartcolumn = require("smartcolumn")
config.setup({
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	-- indent = { enable = false, disable = {} },
	indent = { enable = true, disable = {} },
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	refactor = {
		--highlight_current_scope = { enable = true }, --Highlights the block from the current scope where the cursor is (scope all block code)
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
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
		colors = {
			"#fb4934",
			"#fabd2f",
			"#b8bb26",
			"#83a598",
			"#8ec07c",
			"#d3869b",
			"#fe8019",
		},
	},
	ensure_installed = {
		"bash",
		"dockerfile",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"phpdoc",
		"python",
		"sql",
		"typescript",
		"tsx",
		"vue",
		"toml",
		"yaml",
	},
	context_commentstring = {
		enable = true,
	},
})

local comment = require("Comment")
comment.setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	toggler = {
		line = "<leader>c<leader>",
		block = nil,
	},
	opleader = {
		line = "<leader>c<leader>",
		block = "<leader>bc",
	},
})

-- Custom comment to config
local ft = require("Comment.ft")
ft.blade = { "<!--%s-->" }

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

smartcolumn.setup({
	colorcolumn = "80",
	disabled_filetypes = { "help", "text", "markdown" },
	custom_colorcolumn = {},
	scope = "file",
})
