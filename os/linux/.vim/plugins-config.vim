if !has('gui_running')
  set t_Co=256
endif

" Colorscheme configuration
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['fugitive'], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'fileencoding','percent', 'lineinfo']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'kitestatus': 'kite#statusline',
      \   'fugitive': 'LightlineFugitive',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'separator': {'left':'', 'right':''},
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

" add functions to lightline git, filetype and fileformat (distro symbol)
function! LightlineFugitive()
if exists('*fugitive#head')
  let branch = fugitive#head()
  return branch !=# '' ? ''.branch : ''
endif
return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
 endfunction
  
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
 endfunction

" nerdtree
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""

" Snippets
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips']
let g:UltiSnipsExpandTrigger='<Nop>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Kite
" support languages js python
"let g:kite_supported_languages=['javascript', 'python']
" support languages *
"let g:kite_supported_languages=[*]

" COC
" if kite activated uncomment next two lines
"autocmd FileType pyton let b:coc_suggest_disable=1
"autocmd Filetype javascript let b:coc_suggest_disable=1
autocmd Filetype scss setl iskeyword+=@-@
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-omnisharp',
      \'coc-snippets',
      \'coc-tsserver',
      \]
"Calcurse
autocmd BufRead, BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead, BufNewFile ~/.calcurse/notes/* set filetype=markdown

" You will have bad experience for diagnostic messages when it's default 4000.
" Signify plugin
set updatetime=300
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

"Indentline Vim
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 2 " (default: 2)
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] "change indent Char

"Css hexokinase
let g:Hexokinase_highlighters = [ 'virtual']
" All possible values
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
