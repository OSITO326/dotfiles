"llamar a la extension de plugin management
call plug#begin('~/.vim/plugged')

"Syntax
Plug 'sheerun/vim-polyglot'

"Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

"Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

"Tree
Plug 'scrooloose/nerdtree'

"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'ycm-core/YouCompleteMe'

"Tmux
Plug 'christoomey/vim-tmux-navigator'

"Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'preservim/nerdcommenter' "to comments 
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } "css
"Plug 'unblevable/quick-scope' "navigation

"Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"Icons
Plug 'ryanoasis/vim-devicons'

call plug#end()
