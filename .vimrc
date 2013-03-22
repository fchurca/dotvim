set nocompatible
set hidden " Don't unload buffers when abandonded
set showcmd
set visualbell
set nobackup " State-of-the-seventies. See what we can do about swap directory.
autocmd BufEnter * silent! lcd %:p:h

"" Interface behaviour: input
set mouse=n
set clipboard=unnamed " selection (register *)
"set clipboard=unnamedplus " cut buffer (register +)

" Menu
set wildmenu
set cpo-=<
set wcm=<C-Z>

" Search
set incsearch
set hlsearch

"" Interface behaviour: output
" ruler
set ruler

" Avoid automatic linebreaks in new text
set textwidth=0
set wrapmargin=0
if exists("&colorcolumn")
	highlight ColorColumn ctermbg=darkblue guibg=grey
	set colorcolumn=+2
endif

" Word wrap
set wrap
set linebreak
set wiw=84  " window width. TODO: check if numberwidth+textwidth works somehow
"set tabstop=4

"" Pretty colours (centralize elsewhere? try to use standards?)
" Cursor line and column
set cursorline
"set cursorcolumn
highlight clear CursorLine
highlight CursorLineNr ctermbg=cyan ctermfg=white

" Gutter
set number
"set numberwidth=4 " default value
highlight LineNr guibg=darkgrey ctermbg=darkblue ctermfg=white

" Special, whitespace and such
set list
highlight SpecialKey ctermfg=darkgrey
"autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgrey guifg=darkgrey
highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgrey guifg=darkgrey
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgrey guifg=darkgrey
set listchars=eol:↵,tab:↹→,trail:\ ,extends:>,precedes:<,nbsp:.
match Whitespace / \+/

"" Includes and such
filetype plugin indent on
syntax on

if isdirectory($HOME."/.vim")
	let $HOMEVIM=$HOME."/.vim"
	if filereadable($HOMEVIM."/maps.vim")
		source $HOMEVIM/maps.vim
	endif
	" Vundle
	if isdirectory($HOMEVIM."/bundle")
		set rtp+=$HOMEVIM/bundle/vundle/
		call vundle#rc()
		source $HOMEVIM/bundles.vim
	endif
endif

" Rainbows!
"let g:lisp_rainbow=1
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

