--vim.o.background = "dark" -- or "light" for light mode

--local cmd = vim.cmd
--cmd([[colorscheme gruvbox]])
--
--vim.g.gruvbox_contrast_dark = 'hard'
--vim.g.gruvbox_italic = 'leg g:vim_italiceze_keywords'
--vim.g.gruvbox_italicize_strings = 1
--vim.g.gruvbox_italicize_comments = 1

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
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "italic",
      constants = "NONE",
      functions = "italic",
      keywords = "italic",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "italic",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  }
})

-- setup must be called before loading
vim.cmd("colorscheme dayfox")
