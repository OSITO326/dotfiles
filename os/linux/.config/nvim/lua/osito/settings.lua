local set = vim.opt

--vim.notify = require("notify")

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.termguicolors = true
set.number = true
set.mouse = "a"
set.numberwidth = 2
set.clipboard = "unnamedplus"
set.showcmd = true
set.ruler = true
set.cursorline = true
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.showmatch = true
set.sw = 2
set.relativenumber = true
set.laststatus = 2

set.completeopt = { "menuone", "noselect" } --mostly just for cmp
set.conceallevel = 0 ---- so that `` is visible in markdown files
set.pumheight = 10 -- pop up menu height
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
--set.showtabline = 2 -- always show tabs
set.smartindent = true -- make indenting smarter again
set.updatetime = 300 -- faster completion (4000ms default)
set.scrolloff = 8 -- is one of my fav
set.sidescrolloff = 8
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

--splitbelow = true,                       -- force all horizontal splits to go below current window
--splitright = true,                       -- force all vertical splits to go to the right of current window
--swapfile = false,                        -- creates a swapfile
--timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
--undofile = true,                         -- enable persistent undo
--wrap = false,                            -- display lines as one long line
--guifont = "monospace:h17",               -- the font used in graphical neovim applications

