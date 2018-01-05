" == Color Theme =============================================
colorscheme one

" == Default Settings ========================================
:syntax on
:set hlsearch
:set noswapfile

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

" == Start NeoBundle Scripts ======================================
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/300606/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/300606/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'slim-template/vim-slim'

" == NERDTree ===============================================
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" == Unite ==================================================
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
noremap <C-U><C-F> :Unite -buffer-name=file file<CR> " ファイル一覧
noremap <C-U><C-R> :Unite file_mru<CR> " 最近使ったファイル一覧
au FileType unite nnoremap <silent> <buffer> <expr> <C-i>
au FileType unite inoremap <silent> <buffer> <expr> <C-i>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" == Syntastic ==============================================
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" == VimShell ===============================================
" usage: `:VimShell`
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" == CTags ==================================================
NeoBundle 'soramugi/auto-ctags.vim'
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>_
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
let g:auto_ctags_filetype_mode = 1
set tags+=.git/tags


call neobundle#end()
" == End NeoBundle Scripts ======================================

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
