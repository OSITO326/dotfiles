"shortcut key Space Leader
let mapleader = " "

"atajo de easymotion nmap-> solo funciona en modo normal
nmap <Leader>s <Plug>(easymotion-s2)

"NerdTree shortcut
nmap <Leader>nt :NERDTreeFind<CR>

"Create shortcuts for :w and :q
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"FZF
nmap <Leader>f :Files<CR>

"Move half page faster
nmap <Leader>d <C-d>
nmap <Leader>u <C-u>

"Map key ESC for ii 
:imap ii <ESC>

"CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Tabs Navigation
map <Leader>h :tabprevious<CR>
map <Leader>l :tabnext<CR>

"Use <c-space> to trigger completion
if &filetype == "javascript" || &filetype == "python"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif
