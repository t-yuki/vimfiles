let s:running_windows = has("win16") || has("win32") || has("win64")
if s:running_windows
	set backupdir=~/_vim/backup
	" set undodir=~/_vim/undo
	set directory=~/_vim/tmp
else
	set backupdir=~/.vim/backup
	" set undodir=~/.vim/undo
	set directory=~/.vim/tmp
endif

filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/vim-go-coverlay

"""""""
"vundle
set rtp+=~/.vim/bundle/vundle
set nocompatible
call vundle#begin()
Plugin 'gmarik/vundle'

" plugin on GitHub repo
Plugin 'fatih/vim-go'
Plugin 'bkad/CamelCaseMotion'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'thinca/vim-quickrun'
Plugin 't-yuki/vim-go-coverlay'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"""""""

""quickrun
let g:quickrun_config={'*': {'split': ':botright 4sp'}}
"let g:quickrun_config.go={'command': 'go', 'exec': ['go test -v']}
 
""vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
"let g:go_auto_type_info = 1

"""standard vim-go key bindings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

""vim-go-coverlay
au FileType go nmap <leader>c <Plug>(go-coverlay)
au FileType go nmap <leader>C <Plug>(go-clearlay)
   
"""customized key bindings
"let mapleader = ","
"noremap \ ,

let g:go_def_mapping_enabled = 0
au FileType go nmap gd <Plug>(go-def-split)
"TODO: What did GoFiles mean?
au FileType go nmap <silent> gl :GoFiles<CR>
au FileType go nmap <silent> gL :GoDeps<CR>
au FileType go nmap gr <Plug>(go-rename)
au FileType go nmap gs <Plug>(go-implements)
au FileType go nmap dc <Plug>(go-doc)
au FileType go nmap <leader>v <Plug>(go-vet)
inoremap <c-p> <C-X><C-O>

""CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

""tagbar
nmap <F8> :TagbarToggle<CR>

filetype plugin indent on
syntax on

""autocloser
function s:QuickRun_Exit_OnlyWindow()
  if winnr('$') == 1 
    if (getbufvar(winbufnr(0), '&buftype')) == 'quickfix'
         quit
    endif
    if (getbufvar(winbufnr(0), '&buftype')) == 'nofile'
         quit
    endif
  endif
endfunction
autocmd WinEnter * call s:QuickRun_Exit_OnlyWindow()
