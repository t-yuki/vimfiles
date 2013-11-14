My vimrc on Windows and Linux for golang
========================================

Usage
-----
* :Lint -> execute golint
* :Fmt -> execute gofmt
* :Import xxx -> add import declaration xxx
* :Errors -> show error window (need save)
* :w -> save file and execute gofmt and golint
* \r -> do quickrun. to close, type :on or :only
* <C-X><C-O> -> autocomple by gocode

Setup
-----
Setup note for Go 1.2rc3.
Before setup, you should install Go and set GOPATH env.

### Linux

```shell
git clone https://github.com/t-yuki/vimfiles ~/vimfiles
mkdir -p vimfiles/_vim
ln -s vimfiles/_vim ~/.vim
ln -s vimfiles/_vimrc ~/.vimrc
mkdir -p ~/.vim/{backup,undo,tmp}
go get -u github.com/nsf/gocode
go get -u github.com/golang/lint/...

mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
git clone https://github.com/thinca/vim-quickrun ~/.vim/bundle/vim-quickrun
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
```

### Windows

```shell
git clone https://github.com/t-yuki/vimfiles %HOMEPATH%/_vim
mklink %HOMEPATH%/vimfiles/_vimrc %HOMEPATH%/_vimrc
go get -u -ldflags -H=windowsgui github.com/nsf/gocode
go get -u -ldflags -H=windowsgui github.com/golang/lint/...

git clone https://github.com/thinca/vim-quickrun %HOMEPATH%/_vim/vim-quickrun
```

sendto: %APPDATA%\Microsoft\Windows\SendTo
gvim -> gvim.exe -p
gvimcli -> gvim.exe -p --remote-tab-silent

Refs (Japanese)
---------------
* http://qiita.com/todogzm/items/3c281da10287f7383487
* http://mattn.kaoriya.net/software/vim/20130531000559.htm
* http://golang.org/misc/vim/readme.txt?m=text

