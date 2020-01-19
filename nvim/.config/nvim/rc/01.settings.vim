syntax on
set background=dark
" solarized options
colorscheme solarized8_high

hi Normal guibg=black ctermbg=black

if has("termguicolors")
    " enable true color
    set termguicolors
endif

set guifont=Fira\ Code:h14

filetype off  " required!
filetype plugin indent on     " required!

"For vim-move
let g:move_key_modifier = 'C'

"For ack
let g:ackprg = 'ag --nogroup --nocolor --column'

"inoremap jj <Esc>

set guifont=Source\ Code\ Pro\ for\ Powerline\ :h18

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" 设定文件浏览器目录为当前目录
set bsdir=buffer
" 设置编码
set encoding=utf-8
set nocompatible
set laststatus=2
" 设置文件编码
set fenc=utf-8

"set to use clipboard of system
set clipboard=unnamed

" 设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"显示行号
set number
"Show related row numbers
"set relativenumber

"settings for backspace
set backspace=2
set backspace=indent,eol,start
set expandtab "使用SPACE代替Tab
set shiftwidth=2 "自动缩进宽度

augroup filetype
  autocmd BufNewFile,BufRead Makefile set filetype=make
  autocmd BufNewFile,BufRead makefile.inc set filetype=make
  autocmd BufNewFile,BufRead *.make set filetype=make
  autocmd BufNewFile,BufRead *.mk set filetype=make
  autocmd BufNewFile,BufRead *.vim set filetype=vim
augroup END

"忽略大小写查找
"set ic

" tab宽度
set tabstop=2
set cindent shiftwidth=2
set autoindent shiftwidth=2

" set 折叠
set foldmethod=indent
" 打开文件默认不折叠
set foldlevelstart=99

"set my leader
let mapleader="\<Space>"
"let mapleader=";"

"For neomake
nnoremap <leader>m :Neomake<CR>
let g:neomake_open_list = 2
let g:neomake_list_height = 7

"For ydict Plugin
vnoremap <leader>yv <Esc>:Ydv<CR>
nnoremap <leader>yc <Esc>:Ydc<CR>
nnoremap <leader>ye :<C-u>Yde<CR>

"Disable highlight
nnoremap <leader>n :nohl<CR>

" coc settings
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Settings for vim-easymotion
let g:EasyMotion_leader_key = ","

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.gif,*.jpeg,.DS_Store  " MacOSX/Linux

" settings for resize splitted window
nmap wv        <C-w>v        "垂直分割当前窗口
nmap wc     <C-w>c        "关闭当前窗口
nmap ws        <C-w>s        "水平分割当前窗口
nmap ww    <C-w>w "切换窗口
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>

set updatetime=100
"au TextChangedI * GitGutter

" if you want to disable auto detect, comment out those two lines
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Better whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_only_modified_lines = 1

" auto pairs
let g:AutoPairsFlyMode = 1
