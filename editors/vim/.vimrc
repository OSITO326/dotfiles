set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
syntax on 

so ~/.vim/plugins.vim
so ~/.vim/plugins-config.vim
so ~/.vim/maps.vim
"so ~/.vim/coc-initconfig.vim

"color scheme guvbox contraste alto del tema gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
