local set = vim.opt

--vim.notify = require("notify")
set.nu = true
set.relativenumber = true

set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.expandtab = true

set.smartindent = true -- make indenting smarter again

set.swapfile = false -- creates a swapfile
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true -- enable persistent undo

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8 -- is one of my fav
set.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
set.isfname:append("@-@")

set.updatetime = 50

--set.colorcolumn = "80"

set.clipboard = "unnamedplus"
--set.showcmd = true
--set.ruler = true
set.encoding = "utf-8"
set.fileencoding = "utf-8"
