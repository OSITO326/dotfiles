local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

--> Save/quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)

--> Prettier
--local api = nvim.api.nvim_set_keymap
--api.("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

--> Hop
--map('n', '<leader>s', ':HopChar2<CR>',opts)
vim.api.nvim_set_keymap("", "s", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("", "S", ":HopWord<cr>", { silent = true })

--> Split resize
map("n", "<leader>>", "10<C-w>>", opts)
map("n", "<leader><", "10<C-w><", opts)

--> Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>ob", ":Telescope buffers<CR>", opts)
--> FZF
--map('n', '<leader>f', ':Files<CR>', opts)
--> NerdTreeLua
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-->Buffers
--map('n', '<leader>ob', ':Buffers<CR>', opts)

--> Scrolling
map("n", "<S-j>", "10<C-e>", opts)
map("n", "<S-k>", "10<C-y>", opts)

--> Run Node on current file
map("n", "<leader>x", ":!node %<CR>", opts)
