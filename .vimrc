"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Configuration File"
" Description: Work in progress.  Purpose is to maximize usability for c++
" development, python and web development"
" Target Languages: 
" Tier_1:
" c++, python, lua
" Tier_2:
" webdev: html5, css, javascript
" Tier_3:
" latex
" Author: Isaac Remuant"


" Enviroment {
    " Disable vi compatibility (emulation of old bugs) (many undos with this)
    set nocompatible

    if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
" }

" General {
    scriptencoding=utf-8
	set virtualedit=onemore 	   	        " allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
        " }

set wildignore=*.swp,*.bak,*pyc

execute pathogen#infect()
syntax on
filetype plugin indent on
syntax on
colorscheme desert

" GUI {
    "remove Scrollbars to the right and left.  Permanent and windowed"
    set go-=R
    set go-=L
    set go-=r



    "Add permanent tab line.  This prevents docking issues with "
    "addition or removal of tabs"
    set showtabline=2
" }


" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

let mapleader = '-'
let maplocalleader = '\\'

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Highlight Search"
set hlsearch       

"Sets the working directory to the path of the opened file"
set autochdir

"General Bindings {

"}

" Language Specific Configurations {
"   " I think it should be moved to .vim/after/ftplugin  
    " C++ (cpp) {
    " }
    " Python {
      autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
        " if has("autocmd") 
        "     autocmd    
        " endif has("autocmd")
    " }
    " lua {
            
    " }
    " javascript {

    " }
    " HTML {
        
    " }
    " XML {
        " treat rss/atom as xml
        " autocmd BufNewFile, BufRead *.rss,*.atom setfiletype xml
    " }
    " css {
        
    " }

    " Pascal {
      autocmd FileType pascal setlocal ts=2 sts=2 sw=2 expandtab
        
    " }
" }


inoremap jk <esc>

if has('win32') || has('win64')
    nnoremap <leader>ev :vsplit $DROPBOX/tools/Sync/User/.vim/.vimrc<cr>
    nnoremap <leader>sv :source $DROPBOX/tools/Sync/User/.vim/.vimrc<cr>
else 
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
endif

" 
" VIM CASTS
nmap <leader>l :set list!<CR>

" should do different chars for different OSes.  
set listchars=tab:>\ ,eol:¬


function! <SID>Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <leader>$ :call <SID>Preserve("%s/\\s\\+$//e")<CR> 
nnoremap <silent> <leader>= :call <SID>Preserve("normal gg=G")<CR> 


" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
  
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

