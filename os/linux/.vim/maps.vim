"shortcut key Space Leader
let mapleader = " "

"atajo de easymotion nmap-> solo funciona en modo normal
nmap <Leader>s <Plug>(easymotion-s2)

"Faster scrolling
nmap <Leader>d <C-d>
nmap <Leader>u <C-u>

"NerdTree shortcut
nmap <Leader>nt :NERDTreeFind<CR>

"Buffers
map <Leader>ob :Buffers<CR>

"Split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

"Create shortcuts for :w and :q
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"FZF
nmap <Leader>f :Files<CR>

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

"Run current file
nnoremap <Leader>x :!node %<CR>

"Use <c-space> to trigger completion -> with KITE
"if &filetype == "javascript" || &filetype == "python"
  "inoremap <c-space> <C-x><C-u>
"else
  "inoremap <silent><expr> <c-space> coc#refresh()
"endif
"without KITE
  inoremap <silent><expr> <c-space> coc#refresh()

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

"Barbar mappings & commands
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

