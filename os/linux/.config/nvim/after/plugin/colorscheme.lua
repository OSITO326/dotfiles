local status_ok, themer = pcall(require, "themer")
if not status_ok then
  return
end
-- Themecorp custom colorscheme gruvbox_dark
themer.setup({
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
