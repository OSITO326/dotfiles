local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	--sections = { "error", "warn", "info", "hint" },
	--symbols = { error = " ", warn = " ", info = " ", hint = " " },
	sections = { "error", "warn", "hint" },
	symbols = { error = " ", warn = " ", hint = " " },
	--symbols = { error = " ", warn = " ", info = " ", hint= " "},
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	--icons_enabled = false,
	--icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0.5,
	--left_padding = 0,
	--right_padding = 0.5,
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 1, -- 0 -> Just the filename, 1: Relative path, 2: Absolute path
	symbols = {
		modified = " ",
		--readonly = '',
	},
}

local progress = {
	"progress",
	padding = 1,
}

-- cool function for progress
--local progress = function()
--local current_line = vim.fn.line(".")
--local total_lines = vim.fn.line("$")
--local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--local line_ratio = current_line / total_lines
--local index = math.ceil(line_ratio * #chars)
--return chars[index]
--end
--other cool
--local progress = function()
--local current_line = vim.fn.line(".")
--local total_lines = vim.fn.line("$")
--local chars = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 ", "🌑 "}
--local line_ratio = current_line / total_lines
--local index = math.ceil(line_ratio * #chars)
--return chars[index]
--end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				--theme = 'gruvbox_dark',
				--theme = 'gruvbox-material',
				--theme = 'gruvbox',
				--theme = 'kanagawa',
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				--component_separators = { left = "", right = "" },
				--section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diagnostics },
				lualine_c = { filename },
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				--lualine_x = { diff, spaces, filetype, "encoding" },--
				lualine_x = { diff, filetype },
				lualine_y = { progress },
				lualine_z = { location },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { location },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
