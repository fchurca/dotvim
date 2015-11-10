" Menu
nmap <F10> :emenu <C-Z>

" Control buffers
nmap <C-b> :BufExplorerVerticalSplit<CR>
nmap <C-j> :bprev<CR>
nmap <C-k> :bnext<CR>

" Misc
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-h> :nohlsearch<CR>

" Lazy :
nnoremap ; :
nnoremap ñ :
nnoremap Ñ :

" Scroll over rows instead of lines
noremap k gk
noremap j gj
noremap <Up> gk
noremap <Down> gj

" sudo'ing write
cmap w!! w !sudo tee % >/dev/null

" Indent EVERYTHING
nmap <Leader>= gg=G<C-O><C-O>

" CtrlP
" We already have NerdTREE for files
nmap <C-p> :CtrlPBuffer<CR>

