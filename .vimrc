if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"


let mapleader = ","
"非兼容模式
set nocompatible
"底部标尺
set ru  
"搜索时高亮显示结果
set hls
"输入搜索命令时，显示目前输入的模式的匹配位置
set is
"显示行号
set number
"帮助文档语言 en英文 cn中文
set helplang=cn
"使用:e命令的时候 可选项预览
set wildmenu
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
"set mouse=a
"打开语法高亮
syntax on
syntax enable
"默认配色为darkblue
color desert
"colorscheme evening
"color candy 
"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=1
"使查找替换忽略大小写的选项
"set ic
"gvim下设置无菜单栏工具栏
set go= "无菜单、工具栏
"字体设置
set guifont=monaco:h12
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
"NERDTree shortkey
map <F2> :NERDTreeToggle<CR>
"ctags设置
"set tags=~/public_html/api14/src/scripts/tags
"Tlist配置
map <F3> :Tlist<CR>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Auto_Open=1
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
let Tlist_Display_Prototype=1
let Tlist_Exit_OnlyWindow=1
let g:tlist_javascript_settings='javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
"终端显示
set termencoding=utf-8
"开发时候编译
map <F5> <Esc>:!cd ~/public_html/ui; make dev_pc<CR>
map <F6> <Esc>:!cd ~/work/taxi/webapp; sh deploy.sh<CR>
