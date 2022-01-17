local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

--> Save/quit
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>Q', ':q!<CR>', opts)

--> Easymotion S2
vim.cmd[[vmap <leader>s <Plug>(easymotion-s2)]] 

--> Split resize
map('n', '<leader>>', '10<C-w>>', opts)
map('n', '<leader><', '10<C-w><', opts)

--> FZF
map('n', '<leader>f', ':Files<CR>', opts)
-->Buffers
map('n', '<leader>ob', ':Buffers<CR>', opts)

--> Scrolling
map('n', '<S-j>', '10<C-e>', opts)
map('n', '<S-k>', '10<C-y>', opts)

--> Run Node on current file
map('n', '<leader>x', ':!node %<CR>', opts)
