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
--> Split resize
keymap("n", "<leader>>", "10<C-w>>", opts)
keymap("n", "<leader><", "10<C-w><", opts)
--> Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
--> Change truncate window
keymap("n", "<leader>h<leader>", "<C-w>H", opts)
keymap("n", "<leader>j<leader>", "<C-w>J", opts)
keymap("n", "<leader>k<leader>", "<C-w>K", opts)
keymap("n", "<leader>l<leader>", "<C-w>L", opts)

--keymap("n", "<A-h>", "<C-w>H", opts)
--keymap("n", "<A-j>", "<C-w>J", opts)
--keymap("n", "<A-k>", "<C-w>K", opts)
--keymap("n", "<A-l>", "<C-w>L", opts)

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
----keymap("n", "<leader>hs", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)

--> Git fugitive
keymap("n", "<leader>gs", ":Git status<CR>", opts)
keymap("n", "<leader>ga", ":Git add .<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>gi", ":Git init<CR>", opts)


--> NerdTreeLua
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--> Markdown Preview
keymap("n", "<leader>m", ":MarkdownPreview<CR>", opts)

--> DAP Debugger
keymap("n", "<leader>dbp", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dd", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<leader>de", ":lua require('osito.dap.dap-fn').stop()<CR>", opts)
keymap("n", "<leader>dl", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<leader>dj", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<leader>dk", ":lua require('dap').step_out()<CR>", opts)
keymap("n", "<leader>dt", ":lua require('dap').repl.toggle()<CR>", opts)
keymap("n", "<leader>ds", ":lua require('osito.dap.dap-fn').scopes()<CR>", opts)
keymap("n", "<leader>da", ":lua require('osito.dap.dap-fn').fullscopes()<CR>", opts)
keymap("n", "<leader>dbl", ":lua require('dap').list_breakpoints()<CR>", opts)
keymap("n", "<leader>dbc", ":lua require('dap').clear_breakpoints()<CR>", opts)
keymap("n", "<leader>dc", ":lua require('dap').run_to_cursor()<CR>", opts)
keymap("n", "<leader>dk", ":lua require('dapui').eval()<CR>", opts)
keymap("n", "<leader>dtt", ":lua require('dap-go').debug_test()<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
