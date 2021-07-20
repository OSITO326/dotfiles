"LIGHTLINE
"lightline.vim 
if !has('gui_running')
  set t_Co=256
endif
"Colorscheme configuration
"let g:lightline = {
"      \ 'colorscheme': 'gruvbox',
"      \ }
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
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
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

"nerdtree
"al darle enter a un archivo se cerrara el nerdtree automaticamente
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let g:javascript_plugin_flow = 1

"Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips']

"Kite
let g:kite_supported_languages=['javascript', 'python']

"COC
autocmd FileType pyton let b:coc_suggest_disable=1
autocmd Filetype javascript let b:coc_suggest_disable=1
autocmd Filetype scss setl iskeyword+=@-@

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

"Rainbow Parentheses
let g:rainbow_active=1 
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"Indentline Vim
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 2 " (default: 2)
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] "change indent Char
