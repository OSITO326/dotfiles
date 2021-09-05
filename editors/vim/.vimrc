set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set termguicolors "css
set sw=2
set relativenumber
set laststatus=2
set noshowmode
syntax on 

so ~/.vim/plugins.vim
so ~/.vim/plugins-config.vim
so ~/.vim/maps.vim
so ~/.vim/coc-initconfig.vim

"color scheme guvbox contrast hard of theme gruvbox
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
