set nocompatible
set hidden " Don't unload buffers when abandonded
set showcmd
set visualbell
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

" Buffers
set hidden  " Any buffer can be hidden without first writing
set confirm " On abandoning buffer, Vim will ask whether to save changes

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

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
" Word wrap
set wrap
set linebreak

if exists("&colorcolumn")
	set colorcolumn=80
endif
set wiw=84  " window width. TODO: check if numberwidth+textwidth works somehow
set tabstop=4
set shiftwidth=4
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'

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

"" Backups
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set viminfo+=n~/.vim/backup/.vimindo

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
	highlight StatusLine ctermbg=white ctermfg=lightblue
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

"" Did the author wrap this into a plugin?
" Search for visual selection

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>z <Esc>:%s/<c-r>=GetVisual()<cr>/
