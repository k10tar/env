set tabstop=2
set shiftwidth=2
set expandtab

if !&compatible
set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let loaded_matchparen = 1

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
  call dein#add ('Shougo/unite.vim') 
  call dein#add ('Shougo/VimFiler') 
"  call dein#add ('scrooloose/nerdtree') 
"  call dein#add ('altercation/vim-colors-solarized')
  call dein#add ('tomasr/molokai')
  call dein#add ('mattn/vim-mastodon')

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

"nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-e> :VimFiler<CR>

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
"autocmd ColorScheme * highlight Comment   ctermfg=239
autocmd ColorScheme * highlight Comment   ctermfg=209
autocmd ColorScheme * highlight LineNr   ctermfg=179
autocmd ColorScheme * highlight Normal   ctermbg=none


" buffer change
"nnoremap <silent>bp :bprevious<CR>
"nnoremap <silent>bn :bnext<CR>
"nnoremap <silent>bb :b#<CR>
"nnoremap <silent>bd :bdelete<CR>
nnoremap <C-U><C-B> :Unite buffer<CR>

""" DirArrows
"let g:NERDTreeDirArrows=1
"let g:NERDTreeDirArrowExpandable  = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
"
""" TwitVim
let twitvim_browser_cmd = 'w3m' " for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

""" color
syntax on
"klet g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai
"set background=dark
"set t_Co=256 



""" vim-mastodon
"let g:mastodon_host 'plrm.moe.hm'
"let g:mastodon_access_token 'xxxxx'


""" [Esc]+[Esc]で検索ハイライトを消す
nnoremap <Esc><Esc> :noh<CR>
