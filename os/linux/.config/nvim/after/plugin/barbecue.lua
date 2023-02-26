local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup({
	show_dirname = false,
	symbols = {
		---Modification indicator.
		modified = "●",

		---@type string
		ellipsis = "…",

		---Entry separator.
		---@type string
		separator = "",
	},
	kinds = {
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Enum = "",
		File = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
		Namespace = "",
		Package = "",
		String = "",
		Number = "",
		Boolean = "",
		Array = "",
		Object = "",
		--Key = "",
		Key = "",
		Null = "",
		EnumMember = "",
	},
	theme = {
		normal = { fg = "#928374" },
		--ellipsis = { fg = "#737aa2" },
		separator = { fg = "#A89984" },
		--modified = { fg = "#737aa2" },

		dirname = { fg = "#928374" },
		basename = { italic = true },
		context = {},
	},
})
