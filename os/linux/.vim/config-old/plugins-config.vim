"LIGHTLINE
"lightline.vim 
if !has('gui_running')
  set t_Co=256
endif

"Colorscheme configuration
let g:lightline = {
      \ 'active': {
      "\   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'left': [['mode', 'paste'], ['fugitive'], ['relativepath', 'modified']],
      "\   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
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

"add functions to lightline git, filetype and fileformat (distro symbol)
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

"nerdtree
"al darle enter a un archivo se cerrara el nerdtree automaticamente
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let g:javascript_plugin_flow = 1
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""

"Snippets
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips']
let g:UltiSnipsExpandTrigger='<Nop>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

"Kite
"let g:kite_supported_languages=['javascript', 'python']

"COC
"autocmd FileType pyton let b:coc_suggest_disable=1
"autocmd Filetype javascript let b:coc_suggest_disable=1
autocmd Filetype scss setl iskeyword+=@-@
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-omnisharp',
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

"Barbar
" NOTE: If barbar's option dict isn't created yet, create it
"let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
"let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
"let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
"let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
"let bufferline.tabpages = v:true

" Enable/disable close button
"let bufferline.closable = v:true

" Enables/disable clickable tabs
"let bufferline.clickable = v:true

" Excludes buffers from the tabline
"let bufferline.exclude_ft = ['javascript']
"let bufferline.exclude_name = ['package.json']

" Enable/disable icons
"let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
"let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
"let bufferline.icon_separator_active = '▎'
"let bufferline.icon_separator_inactive = '▎'
"let bufferline.icon_close_tab = ''
"let bufferline.icon_close_tab_modified = '●'
"let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
"let bufferline.insert_at_start = v:false
"let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
"let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
"let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
"let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
"let bufferline.letters =
  "\ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
"let bufferline.no_name_title = v:null
