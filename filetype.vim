if !exists("autocommands_loaded")
	let autocommands_loaded = 1
"	autocmd BufRead * g`"
	autocmd BufRead,BufNewFile *.asd set filetype=lisp
	autocmd BufRead,BufNewFile *.clj set filetype=clojure
	autocmd BufRead,BufNewFile *.scss set filetype=scss.css
endif
