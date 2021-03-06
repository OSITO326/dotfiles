call plug#begin('~/.vim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } "css

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'scrooloose/nerdtree'
" Icons
Plug 'ryanoasis/vim-devicons'

" Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Tmux
"Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'preservim/nerdcommenter' "to comments 

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

call plug#end()
