--vim.opt.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])

--require("kanagawa").setup({
--undercurl = true, -- enable undercurls
--commentStyle = "italic",
--functionStyle = "NONE",
--keywordStyle = "italic",
--statementStyle = "bold",
--typeStyle = "NONE",
--variablebuiltinStyle = "italic",
--specialReturn = true, -- special highlight for the return keyword
--specialException = true, -- special highlight for exception handling keywords
--transparent = false, -- do not set background color
--dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--globalStatus = false, -- adjust window separators highlight for laststatus=3
--colors = {},
--overrides = {},
--})
--vim.cmd("colorscheme kanagawa")

-- Default options
--require('nightfox').setup({
--options = {
---- Compiled file's destination location
--compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--compile_file_suffix = "_compiled", -- Compiled file suffix
--transparent = false,    -- Disable setting background
--terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--dim_inactive = false,   -- Non focused panes set to alternative background
--styles = {              -- Style to be applied to different syntax groups
--comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
--conditionals = "italic",
--constants = "NONE",
----functions = "italic",
--functions = "bold",
--keywords = "italic",
--numbers = "NONE",
--operators = "NONE",
--strings = "NONE",
--types = "NONE",
--variables = "NONE",
--},
--inverse = {             -- Inverse highlight for different types
--match_paren = false,
--visual = false,
--search = false,
--},
--modules = {             -- List of various plugins and additional options
---- ...
--},
--}
--})
-- setup must be called before loading
--vim.cmd("colorscheme dayfox")

-- Themecorp custom colorscheme gruvbox_dark
require("themer").setup({
  --colorscheme = "gruvbox_dark",
  colorscheme = "gruvbox_darker",
	styles = {
		["function"] = { style = "bold" },
		functionbuiltin = { style = "italic" },
		variableBuiltIn = { style = "italic" },
		parameter = { style = "italic" },
		["conditional"] = { style = "italic" },
		["keyword"] = { style = "italic" },
		["tag"] = { style = "bold" },
	},
	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
    telescope = true,
    --telescope = {
      --TelescopeBorder = { fg = "#1a1a2e", bg = "NONE" },
      --TelescopePromptBorder = { fg = "NONE", bg = "NONE" },
      --TelescopePromptNormal = { fg = "white", bg = "NONE" },
      --TelescopePromptPrefix = { fg = "#84c49b", bg = "NONE" },
      --TelescopePromptTitle = { fg = "black", bg = "#fb5c8e" },
      --TelescopePreviewTitle = { fg = "black", bg = "#a29dff" },
      --TelescopeResultsTitle = { fg = "black", bg = "#f79f79" },
      --TelescopeResults = { bg = "NONE" },
      --TelescopeNormal = { bg = "NONE" },
      --TelescopeSelection = { bg = "#565393" },
    --},
	},
	enable_installer = false, -- enable installer module
})
