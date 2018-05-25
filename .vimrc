set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set number

if !&compatible
set nocompatible
endif

let loaded_matchparen = 1

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
"  call dein#add ('scrooloose/nerdtree') 
  call dein#add ('Shougo/unite.vim') 
  call dein#add ('Shougo/vimfiler') 
  call dein#add ('tomasr/molokai')
  call dein#add ('rust-lang/rust.vim')

  call dein#end()
  call dein#save_state()

endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く
" :

let g:python3_host_prog =expand('/usr/bin/python3')


"call map(dein#check_clean(), "delete(v:val, 'rf')")



"""nnoremap <silent><C-e> :NERDTreeToggle<CR>

""" DirArrows
"let g:NERDTreeDirArrows=1
"let g:NERDTreeDirArrowExpandable  = '+'
"let g:NERDTreeDirArrowCollapsible = '-'


" color scheme
" modify highlight
"autocmd ColorScheme * highlight Normal ctermfg=15
"autocmd ColorScheme * highlight Identifier ctermfg=75
"autocmd ColorScheme * highlight Directory  ctermfg=75
"autocmd ColorScheme * highlight MoreMsg   ctermfg=94
"autocmd ColorScheme * highlight modeMsg   ctermfg=95
"autocmd ColorScheme * highlight Conceal   ctermfg=96
"autocmd ColorScheme * highlight vimHiLink   ctermfg=136
"autocmd ColorScheme * highlight vimHiGroup   ctermfg=138
"autocmd ColorScheme * highlight Comment   ctermfg=178
autocmd ColorScheme * highlight LineNr   ctermfg=179


" buffer change
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bd :bdelete<CR>


"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
  
"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50


"vimfiler
let g:vimfiler_as_default_explorer = 1

nnoremap <silent><C-e> :VimFiler<CR>



"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
   
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    	"ESCでuniteを終了
    	nmap <buffer> <ESC> <Plug>(unite_exit)
    	"入力モードのときjjでノーマルモードに移動
    	imap <buffer> jj <Plug>(unite_insert_leave)
    	"入力モードのときctrl+wでバックスラッシュも削除
    	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    	"ctrl+jで縦に分割して開く
    	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    	"ctrl+jで横に分割して開く
    	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    	"ctrl+oでその場所に開く
    	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    endfunction"}}}


""" rust env
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'



"""color
syntax on 
"let g:solarized_termcolors=256
colorscheme molokai
"colorscheme solarized 
set background=dark
set t_Co=256 
