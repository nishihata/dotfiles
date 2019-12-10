" == Color Theme =============================================
colorscheme one

" == Default Settings ========================================
:syntax on
:set hlsearch
:set noswapfile
:set tabstop=2
:set autoindent
:set expandtab
:set shiftwidth=2

" == QuickFix windon move ====================================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" == タブ、空白の可視化 ======================================
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" == 全角スペースをハイライト表示 ============================
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" == Start plug.vim ======================================
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

  " ファイル検索
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  let g:unite_source_history_yank_enable =1
  let g:unite_source_file_mru_limit = 500
  " 大文字小文字を区別しない
  let g:unite_enable_ignore_case = 1
  let g:unite_enable_smart_case = 1

  noremap <C-U><C-F> :Unite -buffer-name=file file<CR> " ファイル一覧
  noremap <C-U><C-R> :Unite file_mru<CR> " 最近使ったファイル一覧
   " 履歴
  nnoremap <silent> ,f  :<C-u>Unite file_mru<CR>
  " grep検索
  nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
  " カーソル位置の単語をgrep検索
  nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
  " grep検索結果の再呼出
  nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR> 

  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

  " unite grep に ag(The Silver Searcher) を使う
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif

  " ツリー表示
  Plug 'scrooloose/nerdtree'
  let NERDTreeShowHidden = 1
  nmap <Leader><Tab> <C-w>w
  nnoremap <silent><C-t> :NERDTreeToggle<CR>

  " タグジャンプ
  Plug 'soramugi/auto-ctags.vim'
  nnoremap <C-]> g<C-]>_
  let g:auto_ctags = 0
  let g:auto_ctags_directory_list = ['.git', '.svn']
  let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
  let g:auto_ctags_filetype_mode = 1
  set tags+=.git/tags

  " 構文チェッカー
  Plug 'scrooloose/syntastic'
  let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'typescript', 'css', 'dockerfile'] }
  let g:syntastic_javascript_checkers=['eslint']
  let g:syntastic_ruby_checkers = ['rubocop']

  " vimでgit操作
  Plug 'tpope/vim-fugitive'
  autocmd QuickFixCmdPost *grep* cwindow
  set statusline+=%{fugitive#statusline()}

  " vim 下部line 表示
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Ruby向けにend自動挿入
  Plug 'tpope/vim-endwise'

  " コメントON/OFFを手軽に実行
  Plug 'tomtom/tcomment_vim'

call plug#end()
""""""""""""""""""""""""""""""

