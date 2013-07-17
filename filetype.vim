autocmd BufRead,BufNewFile *.asd set filetype=lisp
autocmd BufRead,BufNewFile *.clj set filetype=clojure
autocmd BufNewFile,BufRead *.scss set filetype=scss.css
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
