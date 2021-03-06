" leader key Space
let mapleader = " "
"Map key ESC for ii 
:imap ii <ESC>

" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" create shortcuts for :w and :q
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>

" nerdTree shortcut
nmap <Leader>nt :NERDTreeFind<CR>
" fzf
nmap <Leader>f :Files<CR>
"Buffers
map <Leader>ob :Buffers<CR>

" Remap surround to lowercase s so it does not add an empty space
"xmap s <Plug>VSurround

" tabs Navigation
map <Leader>h :tabprevious<CR>
map <Leader>l :tabnext<CR>

" faster scrolling
nnoremap <S-j> 10<C-e>
nnoremap <S-k> 10<C-y>
nmap <Leader>s <Plug>(easymotion-s2)

" run current file
nnoremap <Leader>x :!node %<CR>

" coc go to
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" open terminal split
set splitright
function! OpenTerminal()
  " move to righ most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&bufType", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit 
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal byffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"

    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
