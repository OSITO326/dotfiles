return require'packer'.startup(function()
--> Plugins
  use 'wbthomason/packer.nvim'
  use 'rcarriga/nvim-notify'

  --> LSP
  use 'neovim/nvim-lspconfig' 
  use 'williamboman/nvim-lsp-installer'
  --> CMP plugins
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind-nvim'

  --use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  --use 'quangnguyen30192/cmp-nvim-ultisnips'
  
  --> Colorscheme
  use 'ellisonleao/gruvbox.nvim'
  --> Status bar
  use 'nvim-lualine/lualine.nvim'

  --> NerdTree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  --> Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'

  --plug
  --> Syntax
  use 'sheerun/vim-polyglot'
  use {'rrethy/vim-hexokinase', run = 'make hexokinase' } --css
  --> Typing
  use 'alvan/vim-closetag'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  --> Tmux
  --use 'benmills/vimux'
  use 'christoomey/vim-tmux-navigator'
  --> Autocomplete
  --use {'neoclide/coc.nvim', branch = 'release'}
  --use 'SirVer/ultisnips'
  --use 'honza/vim-snippets'
  --> IDE
  use 'editorconfig/editorconfig-vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'terryma/vim-multiple-cursors'
  use 'easymotion/vim-easymotion'
  use 'mhinz/vim-signify'
  use 'yggdroot/indentline'
  use 'preservim/nerdcommenter' --to comments 

end)
