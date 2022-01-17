local set = vim.opt

vim.notify = require("notify")

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.number = true
set.mouse = "a"
set.numberwidth = 1
set.clipboard = "unnamedplus"
set.showcmd = true
set.ruler = true
set.cursorline = true
set.fileencoding = "utf-8"
set.showmatch = true
set.termguicolors = true
set.sw = 2
set.relativenumber = true
set.laststatus = 2
--set.noshowmode = true

--> coc
set.hidden = true
--set.nobackup = true
--set.nowritebackup = true
set.cmdheight = 1
set.signcolumn = "number"
--set.syntax = true
