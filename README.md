# dotfiles

新しい現場やマシンで、使い慣れた fish と Vim の設定をすぐ再現するための個人設定です。設定本体を Git で管理し、端末固有の値や秘密情報は各マシンに残します。

## 管理しているもの

- `fish/config.fish`: fish の設定。rbenv と Homebrew は見つかった場合だけ初期化します。
- `.vimrc` と `colors/one.vim`: Vim の設定とカラースキーム。
- `Brewfile`: macOS で使う任意の CLI ツール一覧。
- `setup.sh`: 設定をホームディレクトリへリンクします。既存ファイルは日時付きで退避します。

## 新しい macOS でのセットアップ

前提として Git と Homebrew を用意し、このリポジトリを clone します。

```sh
git clone git@github.com:nishihata/dotfiles.git ~/work/my_documents/dotfiles
cd ~/work/my_documents/dotfiles
brew bundle
./setup.sh
```

Homebrew を使わない場合は `brew bundle` を省略して、必要なツールを自分の方法で入れてください。Brewfile は macOS 向けです。

## Vim プラグイン

Vim プラグインを使う場合は vim-plug を入れ、Vim で `:PlugInstall` を実行します。

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

vim-plug がまだなくても Vim 自体は起動でき、プラグイン設定は読み飛ばされます。

## ローカル専用設定

- fish: `~/.config/fish/local.fish`
- Git の名前とメールアドレス: `~/.gitconfig`

端末固有の値、トークン、秘密鍵などをリポジトリへ追加しないでください。
