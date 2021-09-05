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
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo']]
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
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'separator': {'left':'', 'right':''},
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

function! LightlineFugitive()
if exists('*fugitive#head')
  let branch = fugitive#head()
  return branch !=# '' ? ''.branch : ''
endif
return ''
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
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'json']

"Rainbow Parentheses
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'ocaml': {
\			'parentheses': ['start=/(\ze[^*]/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\[|/ end=/|\]/ fold', 'start=/{/ end=/}/ fold'],
\		},
\		'tex': {
\			'parentheses_options': 'containedin=texDocZone',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody,vimExecute',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold'],
\		},
\		'xml': {
\			'syn_name_prefix': 'xmlRainbow',
\			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'php': {
\			'syn_name_prefix': 'phpBlockRainbow',
\			'contains_prefix': '',
\			'parentheses': ['start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\[/ end=/\]/ containedin=@htmlPreproc contains=@phpClTop', 'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold contains_prefix=TOP'],
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\		'xhtml': 0,
\		'html': 0,
\		'sh': 0
\	}
\}

