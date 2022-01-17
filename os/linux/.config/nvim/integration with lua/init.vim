set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require('packer-settings')
lua require('mappings')
lua require('nvim-tree-config')
lua require('lualine-config')
lua require('lsp-config.language-servers')
"lua require('lsp-config.completition')
