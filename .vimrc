let $PATH = '/usr/bin:'.$PATH

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ 14
  elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro:h15
    "set guifont=Monaco:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set laststatus=2
set ruler
set number
set lines=28 columns=90
set hlsearch

set tabstop=8
set shiftwidth=8
set softtabstop=8
set expandtab

set tags=tags;

:colorscheme molokai
let g:rehash256=1
let g:molokai_origin=1

filetype plugin indent on

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:set list

:set encoding=utf-8
:set fileencoding=utf-8


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

let g:ycm_extra_conf_globlist = ['~/dev/*', '/Volumes/android']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments_and_strings=1
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python3'


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
set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
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

let g:linuxsty_patterns = [ "/linux/", "/kernel/", "/c/", "/os/"]
