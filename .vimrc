" allow backspacing over everything in insert mode
set bs=indent,eol,start		
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
"keep 50 lines of command line history
set history=50		

" show the cursor position all the time
set ruler		

let mapleader = ","
"非兼容模式
set nocompatible
"底部标尺
set ru  
"搜索时高亮显示结果
set hlsearch
"输入搜索命令时，显示目前输入的模式的匹配位置
set incsearch
"显示行号
set number
"使用:e命令的时候 可选项预览
set wildmenu
set showcmd
"highlight current column
set cursorcolumn
"highlight current line
"set cursorline
"帮助文档语言 en英文 cn中文
set helplang=cn
"文件默认编码
set encoding=utf-8
"文件保存时使用的编码
set fileencoding=utf-8
"打开文件进行解码的猜测列表，优先以utf-8打开
set fileencodings=utf-8,gbk
"设置命令行高度
set cmdheight=1
"缩进为4个空格宽度
set tabstop=4
"自动缩进使用的空格数
set shiftwidth=4
"编辑插入tab时，把tab算作的空格数
set softtabstop=4
"缩进使用空格
set expandtab
"自动缩进
set autoindent
"不换行
"set nowrap
"鼠标捕捉
set mouse=a
"打开语法高亮
syntax on
syntax enable
"设置字典
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict


"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=1
"使查找替换忽略大小写的选项
"set ic
"gvim下设置无菜单栏工具栏
set go= "无菜单、工具栏
"字体设置
set guifont=monaco:h17
"tab键自动补全
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" 打开php折叠
let php_folding = 1 
" 打开javascript折叠
let b:javaScript_fold=1
" 打开javascript对dom、html和css的支持
let javaScript_enable_domhtmlcss=1

"映射F12键为行号的开关
map <F12> :set number!<CR>
"映射tab键
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>
"映射vimgrep匹配的cn,cp
nmap <C-M> :cn<CR>
"nmap <C-B> :cp<CR>
inoremap jj <ESC>
"ctags设置
"set tags=~/work/mapv/src/tags
"Tlist配置
map <F3> :Tlist<CR>
let Tlist_Ctags_Cmd = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ctags'
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Auto_Open=1
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
let Tlist_Display_Prototype=1
let Tlist_Exit_OnlyWindow=1
let g:tlist_javascript_settings='javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
"终端显示
set termencoding=utf-8

"set list
"开发时候编译
"map <F5> <Esc>:!cd ~/work/mapv; git add .; git commit -m 'update'; git push<CR>

"""""""""""""""""""""""""""""""""""
"vundle plugin
"""""""""""""""""""""""""""""""""""
set	nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"My Bundle here:

Plugin 'The-NERD-tree'
"NERDTree shortkey
map <F2> :NERDTreeToggle<CR>

"Plugin 'majutsushi/tagbar'
"nmap <silent> <F4> :TagbarToggle<CR>
"let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
"let g:tagbar_width = 30

"Color Scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

"Plugin 'sjl/badwolf'

" vim comment plugin
" Plugin 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

" Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" vim-ariline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='molokai'
" let g:airline_theme='solarized'

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#syntastic#enabled  = 1
" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.branch     = '⭠'
let g:airline_symbols.readonly   = '⭤'

let g:airline_symbols.linenr = '⭡'

call vundle#end()

"Color Scheme
set background=dark
set t_Co=256
colorscheme solarized
" colorscheme Tomorrow-Night-Blue
let g:solarized_termcolors=256

set redrawtime=10000
