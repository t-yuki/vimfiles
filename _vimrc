let s:running_windows = has("win16") || has("win32") || has("win64")
if s:running_windows
	set backupdir=~/_vim/backup
	" set undodir=~/_vim/undo
	set directory=~/_vim//tmp
else
	set backupdir=~/.vim/backup
	" set undodir=~/.vim/undo
	set directory=~/.vim/tmp
endif

filetype off
filetype plugin indent off
 
"quickrun
execute pathogen#infect()
let g:quickrun_config={'*': {'split': ':botright 4sp'}}
let g:quickrun_config.go={'command': 'go', 'exec': ['go test']}
 
"misc/vim
set runtimepath+=$GOROOT/misc/vim
auto BufWritePre *.go Fmt
auto FileType go set makeprg=go\ test\ ./... errorformat=%f:%l:\ %m
autocmd QuickfixCmdPost make copen
  
"gocode
for path in split($GOPATH, ':')
  exe "set runtimepath+=" . globpath(path, "src/github.com/nsf/gocode/vim")
endfor
   
"golint
for path in split($GOPATH, ':')
  exe "set runtimepath+=" . globpath(path, "src/github.com/golang/lint/misc/vim")
endfor
auto BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
auto FileType go set errorformat=%*[0-9/]\ %*[0-9:]\ Failed\ parsing\ %f:\ %l:%c:\ %m,%f:%l:%c:\ %m,%f:%l:\ %m
   
filetype plugin indent on
syntax on

"autocloser
function s:QuickRun_Exit_OnlyWindow()
  if winnr('$') == 1 
    if (getbufvar(winbufnr(0), '&buftype')) == 'quickrun'
         quit
    endif
  endif
endfunction
autocmd WinEnter * call s:QuickRun_Exit_OnlyWindow()
