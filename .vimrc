"=========================================================================
"
" Caption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
" 
" Author: cloud.eve
"
" Last Change: 2016年09月23日 15时13分 
"
" Version: 1.0
"
"=========================================================================

" 基本配置
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set mouse=a      " 启动鼠标所有模式，但是右键功能不可用, 可以保证鼠标滚屏在当前屏幕内
set mousehide    " 输入文件时隐藏鼠标
set backspace=indent,eol,start   " 退格键分别可删除缩进，上一行结束，insert之前的字
set showmatch     " 设置匹配模式 
set nobackup      " 不备份
set nowritebackup " 不写入备份文件
set noswapfile    " 关闭交换文件
set history=500	  " history存储长
set ruler         " 显示标尺 
set showcmd       " 显示输入命令 
set incsearch     " 搜索时自动匹配 
set hlsearch      " 高亮搜索项 
set ignorecase    " 无视大小写 
set smartcase     " 如果有大写就区别大小写匹配 
set laststatus=2  " 总是显示状态栏 
" set autowrite     " 切换文件自动保存 https://github.com/terryma/vim-multiple-cursors/raw/master/assets/example1.gif?raw=true
set shortmess=atI  " 关闭欢迎页面
set viewoptions=cursor,folds,slash,unix " viminfo 记录的内容
set virtualedit=onemore             " 光标可以移到当行最后一个字符之后 
set hidden                          " 切换文件不保存，隐藏 
"set confirm       " 退出前验证
"set spell         " 拼写检查
set linespace=0   " 行之间没有多余的空格
set wildmenu      " 自动补全时的文件菜单
set wildmode=list:longest,full " 自动补全时，匹配最长子串，列出文件
set whichwrap=b,s,h,l,<,>,[,]  " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set scrolljump=5  " 光标离开屏幕范围 
set scrolloff=3   " 光标移动至少保留行数

" 格式
"set nowrap        " 取消自动折行
"set smarttab
set tabstop=4     " tab=4空格 
set softtabstop=4 " 回退可以删除缩进 
set shiftwidth=4  " 缩进位宽=4个空格位
set autoindent    " 自动缩进 
set expandtab     " tab由空格表示

set nojoinspaces  " 用J合并两行用一个空格隔开
set splitright    " 用vsplit新建窗口，让新的放右边
set splitbelow    " 用split新建窗口，让新的放下面
set pastetoggle=<F12> " 指定F12进入黏贴模式，可以正常复制缩进
set iskeyword-=.  " 让'.' 作为单词分割符
set iskeyword-=#  " 让'#' 作为单词分割符
set iskeyword-=-  " 让'-' 作为单词分割符
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " 空格等无效字符显示
set textwidth=80  " 内容宽度
set fileencodings=utf-8,gb18030,gbk,big5 " 文件编码

" 开启新的buffer时，自动转到对应文件目录
let g:autochdir = 1
if exists('g:autochdir')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
endif

" 设置u的返回步数限制
if has('persistent_undo')
    set undofile               " 开启u回滚文件记录
    set undolevels=1000         " 最大数量的改变回滚
    set undoreload=10000        " 最大数量重载可回滚行数
endif

" 特殊文件打开
autocmd BufNewFile,BufRead *.py,*.pyw set filetype=python
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType haskell setlocal nospell

" key 映射
let mapleader = ','         " 全局leader设置
let maplocalleader = '_'    " 本地leader设置

" 设置tag和window间快速跳转 
let g:easyWindows = 1
if exists('g:easyWindows')
    " 向上
    map <C-J> <C-W>j<C-W>_  
    " 向下
    map <C-K> <C-W>k<C-W>_
    " 向右
    map <C-L> <C-W>l<C-W>_
    " 向左
    map <C-H> <C-W>h<C-W>_
endif

" 处理折叠行的左右移动
noremap j gj
noremap k gk


" 没sudo却想保存
cmap w!! w !sudo tee % >/dev/null

" ,fc查找冲突的地方
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" ,ff 查找光标后的单词位置，列出选择项
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" 屏幕左移和右移
map zl zL
map zh zH

" 映射vsp这些开启新的buffer,默认目录为当前目录
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" 黏贴板
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

"字体的设置
set guifont=Consolas,Bitstream_Vera_Sans_Mono:h9:cANSI "设置gui下的字体
set gfw=幼圆:h10:cGB2312

" 语法高亮
syntax on

" 缩进和md文件
filetype plugin indent on " 自动根据类型启动对应插件，缩进开启

set cursorline " 选中行高亮 
autocmd BufEnter *.py set cc=81 " 打开py文件81行高亮  
" 之前的高亮线太难看，重新制定颜色，这里的black和iterm2颜色配置中的black一样
hi CursorLine   cterm=NONE ctermbg=black guibg=black  
hi CursorColumn   cterm=NONE ctermbg=black guibg=black " 
highlight ColorColumn ctermbg=black guibg=black
set number " 设置行号
hi LineNr ctermbg=black

" Indent Guides 缩进列对齐线
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1







let g:miniBufExplMapCTabSwitchBufs = 1


"----------------------------------------------------------------------------
"
"      插件区域，使用的是vim-plug插件管理器
"      github地址：https://github.com/junegunn/vim-plug/
"      unix服务器一键安装方法：
"      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"----------------------------------------------------------------------------
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/minibufexplorerpp'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/winmanager'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" 主题插件
Plug 'altercation/vim-colors-solarized'

" python 推荐的相关插件
Plug 'pythoncomplete'
Plug 'yssource/python.vim'
Plug 'python_match.vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'

" 语法检查
Plug  'scrooloose/syntastic'

" 状态栏效果 推荐：***
Plug  'bling/vim-airline'

"Plug 'vim-scripts/taglist.vim'
call plug#end()



"------------------------------------------------------------------------------
"
" WinManager :WMToggle
"
"------------------------------------------------------------------------------

let g:winManagerWindowLayout='FileExplorer'

"------------------------------------------------------------------------------

" plugin - airline
" 就是状态栏的箭头
"
"------------------------------------------------------------------------------
let g:airline_theme="dark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1




"-------------------------------------------------------------------------------
"
" plugin - NERD_tree.vim
"
" 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
" o 打开关闭文件或者目录 t 在标签页中打开
" T 在后台标签页中打开 ! 执行此文件
" p 到上层目录 P 到根目录
" K 到第一个节点 J 到最后一个节点
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录 R 递归刷新当前根目录
"
"-------------------------------------------------------------------------------
" CTRL + E  NERDTree 切换
map <C-e> :NERDTreeToggle<CR>
map <leader>ee :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

"---------------------------------------------------------------------------------
"
" plugin vim-colors-solarized
" solarized 主题
"
"---------------------------------------------------------------------------------
set background=dark
if filereadable(expand("~/.vim/plugged/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    colorscheme solarized             " Load a colorscheme
endif



" syntastic 配置
" 设置每次w保存后语法检查
function! ToggleErrors()
    Errors
endfunction
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let syntastic_loc_list_height = 5
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
autocmd WinEnter * if &buftype ==#'quickfix' && winnr('$') == 1 | quit |endif
autocmd WinLeave * lclose

" 自动补全tab触发
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>


" Ctrlp 和 Ctrlp-funky(,fu)
if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
                \ }

    if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']
        "funky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
    endif
endif

" complete
autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


"是nomal模式的命令，不是Ex模式的

nmap wm :WMToggle<cr>
map <F12> ggO/*<CR>*Copyright(c) 2005-2007 Shanghai LUCENT Telecommunication Corp.<CR>*<CR>*Authored by LUCENT ZJUJOE on:<Esc>:read !date <CR>kJ$a<CR>*<CR>* @desc:<CR>*<CR>* @history<CR>*/
map <C-a> ggvG$
nmap <Leader>man :Man 3 <cword><CR>
ab fc  #include <stdio.h><Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter><Tab>return 0;<Enter>}<Esc><up><up>
ab syso  public static void main(String[] args) 

"-------------------------------------------------------------------------
"
" 添加版权声明文件，
" python文件描述信息
"
"-------------------------------------------------------------------------
autocmd BufNewFile *.py :call AddTitle()
function AddTitle()
    call append(0,"#! /usr/bin/env python")
    call append(1,"# -*- coding: utf-8 -*-")
    call append(2,"# vim:fenc=utf-8")
    call append(3,"#  Copyright © XYM")
    call append(4,"# CreateTime: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(5,"")
endf

