local status_ok, icon_picker = pcall(require, "icon-picker")
if not status_ok then
	return
end

icon_picker.setup({})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>.", "<cmd>IconPickerNormal emoji<cr>", opts)
--vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
vim.keymap.set("i", "<C-.>", "<cmd>IconPickerInsert emoji<cr>", opts)
