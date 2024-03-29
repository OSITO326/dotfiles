local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local keymap_zen = vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").toggle()
	vim.wo.wrap = false
	--ColorMyPencils()
end)

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	--add operators that will trigger motion and text object completion
	--to enable all native operators, set the preset / operators plugin above
	--operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<cr>", "Save" },
	["p"] = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format Document" },
	["q"] = { "<cmd>q!<cr>", "Quit" },
	["u"] = { "<cmd>UndotreeToggle<cr>", "Show Undotree" },

	m = {
		["m"] = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
		["s"] = { "<cmd>MarkdownPreviewStop<cr>", "Markdown Stop" },
		["t"] = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Toggle" },
	},

	d = {
		name = "Debug Adapter Protocol",
		d = { "<cmd>DapContinue<cr>", "Continue" },
		b = { "<cmd>DapToggleBreakpoint<cr>", "Breakpoint" },
		l = { "<cmd>DapStepInto<cr>", "Step Into" },
		j = { "<cmd>DapStepOver<cr>", "Step Over" },
		k = { "<cmd>DapStepOut<cr>", "Step Out" },
		r = { "<cmd>DapToggleRepl<cr>", "Toggle REPL" },
	},

	c = {
		name = "Diaglist",
		a = { "<cmd>lua require('diaglist').open_all_diagnostics()<cr>", "All Diaglist" },
		b = { "<cmd>lua require('diaglist').open_buffer_diagnostics()<cr>", "Diaglist Buffer" },
	},

	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Find Word" },
		b = {
			"<cmd>Telescope buffers<cr>",
			"Buffers",
		},
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
	},

	g = {
		name = "Git",
		s = { "<cmd>Git status<cr>", "Git Status" },
		a = { "<cmd>Git add .<cr>", "Git Add All" },
		c = { "<cmd>Git commit<cr>", "Git Commit" },
		i = { "<cmd>Git init<cr>", "Git Init" },
		p = { "<cmd>Git pull<cr>", "Git Pull" },
		f = { "<cmd>Git fetch --all -p<cr>", "Git Fetch" },
	},

	G = {
		name = "Git Signs",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	h = {
		name = "Harpoon",
		h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu" },
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark Project" },
		j = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Navigates to next mark" },
		k = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Navigates to previous mark" },
	},

	l = {
		name = "LSP  ",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			--"<cmd>Telescope lsp_document_diagnostics<cr>",
			"<cmd>lua vim.diagnostic.open_float()<cr>",
			"Document Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format Document" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		m = { "<cmd>Mason<cr>", "Open Mason" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		U = { "<cmd>MasonUpdateAll<cr>", "Update all packages installed on mason" },
	},

	P = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		l = { "<cmd>luafile %<cr>", "Source Lua File" },
	},

	z = {
		name = "Zen Mode",
		z = { keymap_zen, "ZenMode" },
	},

	["<c-w>"] = {
		name = "Window",
		h = { "<c-w>H", "Truncate to left" },
		j = { "<C-w>J", "Truncate to down" },
		k = { "<C-w>K", "Truncate to up" },
		l = { "<C-w>L", "Truncate to right" },
		H = { "<C-w>10<", "Resize window to 10x left" },
		J = { "<C-w>10-", "Resize window to 10x down" },
		K = { "<C-w>10+", "Resize window to 10x up" },
		L = { "<C-w>10>", "Resize window to 10x right" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
