"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Configuration File"
" Description: Work in progress.  Purpose is to maximize usability for c++
" development, python and web development"
" Author: Isaac Remuant"

" Enviroment {
    " Basics {
        " Disable vi compatibility (emulation of old bugs) (many undos with this)
        set nocompatible " must be first line according to Steve Francia
    " }
" }
    " TODO: make it use .vim like in unix as Steve Francia does. to provide
    " cross platform compatibility.
    
	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier. 
		if has('win32') || has('win64')
		  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		endif
	" }
    
" General {
        set background=dark     " Assume a dark background

        syntax on
        filetype indent plugin on

	set mouse=a					" automatically enable mouse usage

        scriptencoding=utf-8
	set virtualedit=onemore 	   	        " allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
        " }
" Pathogen {
    " Use pathogen to easily modify the runtime path to include all
    " plugins under the ~/.vim/bundle directory
    set nocp " problemas con pathogen"
    set rtp+=D:/dropbox/tools/Sync/User/.vim/autoload
    
    call pathogen#infect()
    call pathogen#helptags()
    call pathogen#runtime_append_all_bundles()
        "}
        
" set colorscheme
colorscheme desert

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"set spell"

"Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide. Visual Studio expects each tab to be four columns wide. This is the only command here that will affect how existing text displays. "
set tabstop=4
"Set softtabstop to control how many columns vim uses when you hit Tab in insert mode"
set softtabstop=4
"Change tabs into spaces"
set expandtab

"Technically your settings for PEP8 conformance are incorrect, instead you should use:"
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=99
au FileType text setlocal textwidth=255
au FileType python setlocal textwidth=79
au FileType pascal setlocal softtabstop=2 shiftwidth=2
"the difference being that the actual tab character is still eight columns wide (as specified by the python language), but using the tab key, backspace and indent/deindent ( keys) will correctly shift you by 4 spaces."



"for all python files.  Tab config"
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 autoindent foldmethod=indent 
"au FileType cpp, c setlocal tabstop=20 expandtab shiftwidth=20a softtabstop=20" 

"Highlight Search"
set hlsearch       
	   
" enable and disable line numbers (disabled by default)"
set nonumber
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Map <F5> to run python script for the file and keep it in interpreter mode"
" later.  TODO_ , should check it's only for python.  C++ should compile and "
" run and others should do other things."
" The -B means it won't generate bytecode"
au FileType python noremap <F5> :w <CR> :!start "python" -i -B % <CR>
au FileType python noremap <F4> :w <CR> :!start "C:/python/x86/Python27/Scripts/ipython.exe" -i % <CR>
au FileType python noremap <F6> :w <CR> :!start "c:/Program Files (x86)/Mozilla Firefox/firefox.exe" -new-tab http://localhost:8081 <CR>
au FileType text noremap <F5> :ls <CR>
"remove Scrollbars to the right and left.  Permanent and windowed"
set go-=R
set go-=L
set go-=r

"Add permanent tab line.  This prevents docking issues with "
"addition or removal of tabs"
set showtabline=2

"Sets the working directory to the path of the opened file"
set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "Buffer navigation (Ctrl+Tab / Ctrl+Shift+Tab)"
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = "$HOME/vimfiles/ftplugin/pydiction/complete-dict"
"default 15"
let g:pydiction_menu_height = 15  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim latex"
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"
" filetype plugin on (Already have it)

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on"

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tasklist tokesn "
"noremap <leader>v <Plug>TaskList"

let mapleader = ","

:noremap <leader>v <Plug>TaskList

let g:tlWindowPosition = 1
let g:tlRememberPosition = 1
let g:tlTokenList = ['TODO_', 'DECIDE_', 'TOKEN3']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save folding state on file open/close "
"au BufWinLeave * silent! mkview"
"au BufWinEnter * silent! loadview"

let MRU_File = expand("$VIM/.vim_mru_files")
let MRU_Max_Entries = 1000
"Window Height: default 8"
let MRU_Window_Height = 8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Tlist_Ctags_Cmd = expand('D:\Dropbox/tools/ctags58/ctags.exe')

" Omnicompletion"
set ofu=syntaxcomplete#Complete 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Syntax files for GLSL 400 and GLSL 330 " 
command SetGLSLFileType call SetGLSLFileType()
function SetGLSLFileType()
  for item in getline(1,10)
    if item =~ "#version 400"
      execute ':set filetype=glsl400'
      break
    endif
    if item =~ "#version 330"
      execute ':set filetype=glsl330'
      break
    endif
  endfor
endfunction
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl SetGLSLFileType

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pascal "
au BufNewFile,BufRead *.lpr set filetype=pascal
au BufNewFile,BufRead *.pp set filetype=pascal
au BufNewFile,BufRead *.ppu set filetype=pascal

" templates "
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
" autocmd! BufNewFile * silent! 0r ~/.vim/skel/Makefile:e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" FOOLING AROUND WITH VIMSCRIPT 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap - ddp
noremap _ ddkkp

