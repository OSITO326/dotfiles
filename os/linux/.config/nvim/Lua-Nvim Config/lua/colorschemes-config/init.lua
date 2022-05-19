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
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "italic",
      constants = "NONE",
      functions = "italic",
      keywords = "italic",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
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


-- Gruvbox material
--vim.g.gruvbox_material_background = 'medium'
--vim.g.gruvbox_material_statusline_style = 'original'
--vim.opt.background = "dark"
--vim.g.gruvbox_material_palette = 'original'
--vim.g.gruvbox_material_better_performance = 1
--vim.g.gruvbox_material_enable_bold = 1
--vim.g.gruvbox_material_enable_italic = 1
--vim.g.gruvbox_material_ui_contrast = 'high'
--vim.g.gruvbox_material_transparent_background = 2
--vim.g.gruvbox_material_diagnostic_text_highlight = 1
--vim.g.gruvbox_material_diagnostic_line_highlight = 1
--vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
--vim.g.gruvbox_material_disable_terminal_colors = 0
--vim.cmd("colorscheme gruvbox-material")
