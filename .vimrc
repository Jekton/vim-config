"let $PATH = '/usr/bin:'.$PATH

if has("gui_running")
  if has("gui_gtk3")
    set guifont=Source\ Code\ Pro\ 12
  elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro:h16
    "set guifont=Monaco:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set laststatus=2
set ruler
set number
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set tags=tags;

:colorscheme molokai
let g:rehash256=1
let g:molokai_origin=1

filetype plugin indent on

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:set list

:set encoding=utf-8
:set fileencodings=utf-8
:set termencoding=utf-8
:set nowrap


set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"



"  ConqueTerm
:function! ConqueMan()
    let cmd = &keywordprg . ' '
    if cmd ==# 'man ' || cmd ==# 'man -s '
        if v:count > 0
            let cmd .= v:count . ' '
        else
            let cmd = 'man '
        endif
    endif
    let cmd .= expand('<cword>')
    execute 'ConqueTermSplit' cmd
:endfunction
:map K :<C-U>call ConqueMan()<CR>
:ounmap K
let g:ConqueTerm_StartMessages = 0


syn on                      "语法支持

"common conf {{             通用配置
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set cursorline              "为光标所在行加下划线
set autoread                "文件在Vim之外修改过，自动重新读入

set ignorecase              "检索时忽略大小写
set hls                     "检索时高亮显示匹配项
set foldmethod=syntax       "代码折叠
"}}

" conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

"conf for plugins {{ 插件相关的配置
"状态栏的配置 
"powerline{
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'

imap <D-space> <Esc>

