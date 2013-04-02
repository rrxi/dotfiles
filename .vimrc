
" Vundle
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'peaksea'
Bundle 'stlrefvim'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'OmniCppComplete'
Bundle 'grep.vim'
Bundle 'taglist.vim'
Bundle 'winmanager'
"Bundle 'minibufexpl.vim'
Bundle 'genutils'
"Bundle 'lookupfile'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'echofunc.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Mark'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set helplang=cn            "使用中文帮助文档
"set fileencoding=gbk       "查看utf-8格式的帮助文档
set fileencodings=utf8,gbk    "支持打开gbk格式的文件

colorscheme peaksea        "设置窗口颜色
set background=dark
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12    "设置字体为Bitstream Vera Sans Mono 12大小
"set guifont=Consolas:h12:cANSI
set expandtab "使用SPACE代替Tab
set tabstop=4            "设置tab的跳数
set shiftwidth=4 "自动缩进宽度
set backspace=2            "设置退格键可用
set nu!                    "设置显示行号
set wrap                "设置自动换行
"set nowrap                "设置不自动换行
set linebreak            "整词换行,与自动换行搭配使用,效果很好
set whichwrap=b,s,<,>,[,]    "光标可以从行首和行尾跳到另一行去
"set list                "显示制表符
"set listchars=tab:.\ ,trail:.    "将制表符显示为'.   '
set autochdir            "自动设置当前目录为正在编辑的目录
set hidden                "自动隐藏没有保存的缓冲区,切换buffer时不给出保存当前buffer的提示
set scrolloff=5            "在光标接近底端或顶端时,自动下滚或上滚. 
"设置无备份文件
set nobackup
set nowritebackup
"Toggle Menu and Toolbar 隐藏菜单栏和工具栏
set guioptions-=m
set guioptions-=T
"map <silent> <F2> :    if &guioptions =~# 'T' <bar>
"                         \set guioptions-=T <bar>
"                         \set guioptions-=m <bar>
"                         \else <Bar>
"                           \set guioptions+=T <bar>
"                           \set guioptions+=m <bar>
"                       \endif<CR>
let g:load_doxygen_syntax=1
"========================================================================================================
"查找/替换相关的设置
"========================================================================================================
set hlsearch            "高亮显示查找结果
set incsearch            "增量查找
set gdefault            "替换时,使用g标签成为默认设置. 在替换时,替换本行所有符合的匹配
"========================================================================================================
"状态栏的设置
"========================================================================================================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]    "显示文件名: 总行数, 总的字符数
set ruler                "在编辑过程中, 在右下角显示光标位置的状态行
"========================================================================================================
"设置C++开发环境
"========================================================================================================
syntax enable            "打开语法高亮
syntax on                "打开语法高亮
                        "在.vim/syntax/c.vim文件中设置了运算符,函数名等高亮
set showmatch            "设置匹配模式, 相当于括号匹配
set smartindent            "智能对齐
set shiftwidth=4        "换行时,交错使用4个空格
set autoindent            "设置自动对齐
set ai!                    "设置自动缩进

"--------------------------------------------------------------------------------------------------------
"代码折叠
"--------------------------------------------------------------------------------------------------------

"--------------------------------------------------------------------------------------------------------
"窗口操作的快捷键
"--------------------------------------------------------------------------------------------------------
nmap wv        <C-w>v        "垂直分割当前窗口
nmap wc     <C-w>c        "关闭当前窗口
nmap ws        <C-w>s        "水平分割当前窗口
nmap ww    <C-w>w "切换窗口
"nmap mru  :MRU<CR> "打开最近文件

"--------------------------------------------------------------------------------------------------------
"插件配置
"--------------------------------------------------------------------------------------------------------

"TList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1    "设置Tlist

"winmannger
let g:winManagerWindowLayout='FileExplorer|TagList'     "将winmanager设置成浏览器和TagList的组合
nmap wm :WMToggle<cr>         "映射winmanager的快捷键

"cscope
if has("cscope")
    if filereadable("cscope.out")
        cs add cscope.out
    else
        let cscope_file=findfile("cscope.out",".;")
        let cscope_pre=matchstr(cscope_file,".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            exec "cs add" cscope_file cscope_pre
        endif
    endif
    set cscopequickfix=s-,c-,d-,i-,t-,e-    "设定使用quickfix窗口来显示cscope的结果
    "映射cscope的快捷键
    if &term == "screen"
        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> "查找C语言符号，即查找函数名、宏、枚举值等出现的地方
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> "查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> "查找调用本函数的函数
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> "查找指定的字符串
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> "查找egrep模式，相当于egrep功能，但查找速度快多了
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> "查找并打开文件，类似vim的find功能
        nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "查找包含本文件的文件
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> "查找本函数调用的函数
    else
        nmap <F5>s :cs find s <C-R>=expand("<cword>")<CR><CR> "查找C语言符号，即查找函数名、宏、枚举值等出现的地方
        nmap <F5>g :cs find g <C-R>=expand("<cword>")<CR><CR> "查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
        nmap <F5>c :cs find c <C-R>=expand("<cword>")<CR><CR> "查找调用本函数的函数
        nmap <F5>t :cs find t <C-R>=expand("<cword>")<CR><CR> "查找指定的字符串
        nmap <F5>e :cs find e <C-R>=expand("<cword>")<CR><CR> "查找egrep模式，相当于egrep功能，但查找速度快多了
        nmap <F5>f :cs find f <C-R>=expand("<cfile>")<CR><CR> "查找并打开文件，类似vim的find功能
        nmap <F5>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "查找包含本文件的文件
        nmap <F5>d :cs find d <C-R>=expand("<cword>")<CR><CR> "查找本函数调用的函数
    endif
endif

"映射QuickFix的快捷键
if &term == "screen"
    nmap <C-\>w :cw<cr>        "打开quickfix窗口
    nmap <C-\>n :cn<cr>        "前一项
    nmap <C-\>p :cp<cr>        "后一项
else
    nmap <F5>w :cw<cr>        "打开quickfix窗口
    nmap <F5>n :cn<cr>        "前一项
    nmap <F5>p :cp<cr>        "后一项
endif

"MiniBufExp
"let g:miniBufExplMapWindowNavVim = 1            "使用<C-h,j,k,l>在窗口之间移动
"let g:miniBufExplMapWindowNavArrows = 1         "使用<C-箭头>在窗口之间移动

"BufTab
noremap <C-h> :bprev<CR>                         "使用<C-h>切换到上一个buffer
noremap <C-l> :bnext<CR>                         "使用<C-l>切换到下一个buffer
let g:buftabs_only_basename=1                    "只显示文件名，忽略路径名
set laststatus=2                                 "和下面的设置一起将buffer名显示在状态栏中
let g:buftabs_in_statusline=1

"A
nnoremap <silent> <F9> :AV<cr>       "将F9设置成头/源文件切换的快捷键,将窗口分为左右两个窗口，并打开.h/.c文件
let g:alternateSearchPath = 'sfr:./,sfr:../include,sfr:../../include,sfr:../source,sfr:../src,sfr:../inc'

"Grep
"将F3设置成Grep查找的快捷键
nnoremap <silent> <F3> :Grep<cr>
"设置补全
filetype plugin indent on
set completeopt=longest,menu
"设置超级补全
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"设置Doxygen的注释
let g:DoxygenToolkit_authorName="JEMYZHANG" 
"let g:DoxygenToolkit_briefTag_funcName = "yes"
if &term == "screen"
    map <C-x>a :DoxAuthor<cr>
    map <C-x>f :Dox<cr>
    "map <C-x>b :DoxBlock<cr>
    map <C-x>v A //!< 
    map <C-x>c O/** */<Left><Left>
else
    map <F4>a :DoxAuthor<cr>
    map <F4>f :Dox<cr>
    "map <F4>b :DoxBlock<cr>
    map <F4>v A //!< 
    map <F4>c O/** */<Left><Left>
endif


"设置robix阅读时的ctags和cscope的设置，有时间写一个脚本自动设置。
"脚本思路是将所有工程都放在/home/aleln/workspace/下面使用搜索来自动添加设置
"set tags=/home/aleln/workspace/robix3/tags
"cs add /home/aleln/workspace/robix3/cscope.out /home/aleln/workspace/robix3
set tags=tags;
set autochdir

"vimlite
"set nocp
"command -nargs=? W :w !sudo tee % > /dev/null

"fuzzyfind
if &term == "screen"
    nmap <C-f>f :FufFile<cr>
    nmap <C-f>b :FufBuffer<cr>
    nmap <C-f>T :FufTag<cr>
    nmap <C-f>t :FufTagWithCursorWord<cr>
else
    nmap <F5>f :FufFile<cr>
    nmap <F5>b :FufBuffer<cr>
    nmap <F5>T :FufTag<cr>
    nmap <F5>t :FufTagWithCursorWord<cr>
endif
