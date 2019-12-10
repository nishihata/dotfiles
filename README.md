# dotfiles
my settings

## setup

* Homebrew
  * $ brew install ag

* vim-plug をインストールする（下記を参照）
  https://github.com/junegunn/vim-plug#installation

* .vimrcをコピーして `:PlugInstall` を実行

## vimproc
* uniteとagを合わせて使うにはmac標準のvimだと証明書エラーが発生する可能性がある。
  * brew install vim などでinstallすることで回避可能
  * :VimProcInstall
