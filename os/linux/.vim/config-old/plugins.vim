"llamar a la extension de plugin management
call plug#begin('~/.vim/plugged')

"Syntax
"Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } "css
"Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' } "ES7 JavaScript TypeScript extension vscode

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
"Plug 'romgrk/barbar.nvim' "tab buffer
"Plug 'unblevable/quick-scope' "navigation

"Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"Icons
Plug 'ryanoasis/vim-devicons'
"Plug 'kyazdani42/nvim-web-devicons' "devicons to barbar plugin

call plug#end()
