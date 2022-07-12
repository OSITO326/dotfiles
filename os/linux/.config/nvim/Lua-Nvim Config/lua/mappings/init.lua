-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

--> Save/quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":q!<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--> Prettier
--local api = nvim.api.nvim_set_keymap
--api.("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

-- Normal Mode --
--> navigation
--keymap("n", "f", "l", opts)
--keymap("n", "d", "h", opts)
--> Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--> Scrolling
keymap("n", "<S-j>", "10<C-e>", opts)
keymap("n", "<S-k>", "10<C-y>", opts)

--> Run Node on current file
keymap("n", "<leader>x", ":!node %<CR>", opts)

--> Hop
--map('n', '<leader>s', ':HopChar2<CR>',opts)
keymap("", "s", ":HopChar2<cr>", { silent = true })
keymap("", "S", ":HopWord<cr>", { silent = true })

--> Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--> Split resize
keymap("n", "<leader>>", "10<C-w>>", opts)
keymap("n", "<leader><", "10<C-w><", opts)

--> Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- buffers
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

--> Harpoon
keymap("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>hj", ":lua require('harpoon.ui').nav_next()<CR>", opts)
keymap("n", "<leader>hk", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
--keymap("n", "<leader>hs", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)

--> Git fugitive
keymap("n", "<leader>gs", ":Git status<CR>", opts)
keymap("n", "<leader>ga", ":Git add .<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>gi", ":Git init<CR>", opts)


--> FZF
--map('n', '<leader>f', ':Files<CR>', opts)

--> NerdTreeLua
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--> Markdown Preview
keymap("n", "<leader>m", ":MarkdownPreview<CR>", opts)

--> DAP Debugger
--keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
--keymap("n","<F10>", ":lua require'dap'.step_over()<CR>", opts)
--keymap("n","<F11>", ":lua require'dap'.step_into()<CR>", opts)
--keymap("n","<F12>", ":lua require'dap'.step_out()<CR>", opts)
--keymap("n","<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
--keymap("n","<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
--keymap("n","<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
--keymap("n","<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
--keymap("n","<leader>dl", ":lua require'dap'.run_last()<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
