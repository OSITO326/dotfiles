vim.g.mapleader = " "
local options = {
	number = true, -- Show numberline
	relativenumber = true, -- Show relative numberline
	tabstop = 2, -- Number of space in a tab
	shiftwidth = 2, -- Number of space inserted for indentation
	softtabstop = 2,
	expandtab = true, -- Enable the use of space in tab
	showtabline = 2, -- always display tabline
	smartindent = true, -- Smarter autoindentation
	swapfile = false,
	backup = false,
	undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
	undofile = true, -- Enable persistent undo
	hlsearch = false,
	incsearch = true,
	termguicolors = true, -- Enable 24-bit RGB color in the TUI
	scrolloff = 8, -- Number of lines to keep above and below the cursor
	signcolumn = "yes", -- Always show the sign column
	clipboard = "unnamedplus", -- Connection to the system clipboard
	fileencoding = "utf-8", -- File content encoding for the buffer

	breakindent = true, -- Wrap indent to match  line start
	cmdheight = 0, -- hide command line unless needed
	completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
	copyindent = true, -- Copy the previous indentation on autoindenting
	cursorline = true, -- Highlight the text line of the cursor
	fillchars = { eob = " " }, -- Disable `~` on nonexistent lines

	-- foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
	foldcolumn = "1",
	foldlevel = 99, -- set high foldlevel for nvim-ufo
	foldlevelstart = 99, -- start with all code unfolded
	foldenable = true, -- enable fold for nvim-ufo
	history = 100, -- Number of commands to remember in a history table
	ignorecase = true, -- Case insensitive searching
	infercase = true, -- Infer cases in keyword completion
	laststatus = 3, -- globalstatus
	linebreak = true, -- Wrap lines at 'breakat'
	mouse = "a", -- Enable mouse support
	preserveindent = true, -- Preserve indent structure as much as possible
	pumheight = 10, -- Height of the pop up menu
	showmode = false, -- Disable showing modes in command line
	sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
	smartcase = true, -- Case sensitivie searching
	splitbelow = true, -- Splitting a new window below the current one
	splitkeep = vim.fn.has("nvim-0.9") == 1 and "screen" or nil, -- Maintain code view when splitting
	splitright = true, -- Splitting a new window at the right of the current one
	timeoutlen = 500, -- Shorten key timeout length a little bit for which-key
	updatetime = 300, -- Length of time to wait before triggering the plugin
	virtualedit = "block", -- allow going past end of line in visual block mode
	-- wrap = false, -- Disable wrapping of lines longer than the width of window
	wrap = true, -- Disable wrapping of lines longer than the width of window
	writebackup = false, -- Disable making a backup before overwriting a file
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
