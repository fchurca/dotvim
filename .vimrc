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

let mapleader = ","

" Menu
set wildmenu
set cpo-=<
set wcm=<C-Z>

" Search
set incsearch
set hlsearch

"" Interface behaviour: output
"set scrolloff=3
" ruler
set ruler
" status line:
"  0: never
"  1: only if there are at least two windows
"  2: always
set laststatus=2

" Avoid automatic linebreaks in new text
set textwidth=0
set wrapmargin=0
if exists("&colorcolumn")
	set colorcolumn=+2
endif

" Word wrap
set wrap
set linebreak
set wiw=84  " window width. TODO: check if numberwidth+textwidth works somehow
"set tabstop=4

" Cursor line and column
set cursorline
"set cursorcolumn

" Gutter
set relativenumber
"set number
"set numberwidth=4 " default value

" Special, whitespace and such
set list
set listchars=eol:↵,tab:↹→,trail:\ ,extends:>,precedes:<,nbsp:.
"match Whitespace / \+/

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
		let $BUNDLES=$HOMEVIM.'/bundles'
		if filereadable($BUNDLES)
			for line in readfile($BUNDLES)
				Bundle line
			endfor
		endif
		"source $HOMEVIM/bundles.vim
	endif
endif

" Rainbows!
"let g:lisp_rainbow=1
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
"
"" Pretty colours (centralize elsewhere? try to use standards?)
if $USER != 'root'
	if exists("&colorcolumn")
		highlight ColorColumn ctermbg=darkblue guibg=grey
	endif
	highlight clear CursorLine
	highlight CursorLineNr ctermbg=cyan ctermfg=white
	highlight LineNr guibg=darkgrey ctermbg=darkblue ctermfg=white
	highlight SpecialKey ctermfg=darkgrey
	highlight StatusLine ctermbg=white ctermfg=darkblue
else
	if exists("&colorcolumn")
		highlight ColorColumn ctermbg=darkred guibg=grey
	endif
	highlight clear CursorLine
	highlight CursorLineNr ctermbg=red ctermfg=white
	highlight LineNr guibg=darkgrey ctermbg=red ctermfg=black
	highlight SpecialKey ctermfg=darkgrey
	highlight StatusLine ctermbg=white ctermfg=darkred
endif
"autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgrey guifg=darkgrey
"highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgrey guifg=darkgrey
"highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgrey guifg=darkgrey

