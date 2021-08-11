"llamar a la extension de plugin management
call plug#begin('~/.vim/plugged')

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
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"Plug 'sirver/ultisnips' "install dependencies (python-pynvim) on archlinux or pip3 install neovim other distros
"Syntax
Plug 'sheerun/vim-polyglot'

"IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdcommenter' "to comments 
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'

"Icons
Plug 'ryanoasis/vim-devicons'

"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"ZSH ZPlug
"Plug 'agkozak/vim-zsh', { 'for': 'zsh', 'branch': 'develop' }
"Plug 'zinit-zsh/zinit-vim-syntax', { 'for': 'zsh' } Intalar este

call plug#end()
