My vimrc on Linux for golang
============================

Usage
-----
| Command            | Description                                    |
|--------------------|------------------------------------------------|
| `:w`               | save file and execute goimports                |
| `<C-P>`            | **autocomple** by gocode on insert-mode        |
| `<F8>`             | **open tagbar**                                |
| `gd`               | godef **code jump** on split window            |
| `gl`               | list files those depend on the current package |
| `gL`               | **list dependencies** of the current package   |
| `gr`               | **refactor the identifier** under cursor       |
| `gs`               | **list implemented interfaces** by the type    |
| `dc`               | **show godoc** under cursor                    |
| `\v`               | quickrun `go vet`. type :on to close           |
| ------------------ | ---------------------------------------------- |
| `\dt`              | godef code jump on another tab                 |
| `\e`               | refactor the identifier by `gorename`          |
| `\r`               | quickrun `go run`. type :on to close           |
| `\t`               | quickrun `go test`. type :on to close          |
| `\s`               | show interfaces implemented by the type        |
| `\i`               | show type info under cursor                    |
| `\gd`              | show godoc under cursor                        |
| :help vim-go       | show help of vim-go                            |
| :help go-commands  | show help of vim-go                            |
| :help go-mappings  | show help of vim-go                            |
| :help go-settings  | show help of vim-go                            |

For more details: see https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

| Command (:help go-commands for full help) | Description       |
|--------------------|------------------------------------------|
| :GoImport xxx      | add import declaration xxx               |
| :GoImportAs yy xxx | add import declaration xxx as yy         |
| :GoLint            | execute golint                           |
| :GoFmt             | execute gofmt                            |
| :GoImprots         | execute goimports                        |
| :GoDrop xxx        | drop import declaration xxx              |
| :GoDoc xxx         | open godoc xxx                           |
| :GoVet             | run go vet                               |
| :Godef             | show godef                               |

Setup
-----
Setup note for Go 1.4beta1
Before setup, you should install Go and set GOPATH env.

### Linux

```shell
(command -v yum && sudo -E yum install ctags) || sudo -E apt-get install ctags

git clone https://github.com/t-yuki/vimfiles ~/vimfiles
(cd ~/vimfiles && git submodule update --init)
mkdir -p ~/vimfiles/_vim
ln -s ~/vimfiles/_vim ~/.vim
ln -s ~/vimfiles/_vimrc ~/.vimrc
mkdir -p ~/.vim/{backup,tmp}
mkdir -p ~/.vim/autoload ~/.vim/bundle
vim +PluginInstall +qall
vim +"set filetype=go" +GoInstallBinaries +qall
## for update:
# vim +PluginUpdate +"set filetype=go" +GoUpdateBinaries +qall
```

### For Neovim
```
export XDG_CONFIG_HOME=~/.config
mkdir -p ~/.config
ln -s ~/vimfiles/_vim ~/.config/nvim
alias vi=nvim
alias vim=nvim
```

### For GNU Screen
```
# requires 256 colors.
ln -s ~/vimfiles/_screenrc ~/.screenrc
```

Refs (Japanese)
---------------
* http://qiita.com/todogzm/items/3c281da10287f7383487
* http://mattn.kaoriya.net/software/vim/20130531000559.htm
* http://golang.org/misc/vim/readme.txt?m=text

