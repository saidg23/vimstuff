set number
set numberwidth=4
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set nowrap
set title
set noshowmode
set laststatus=2
set nohlsearch
set splitbelow
set splitright

set hidden

"----------------------------------------------------------------------------------------------

syntax enable

set termguicolors
colorscheme customblue

"----------------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'ajh17/VimCompletesMe'

Plug 'itchyny/lightline.vim'

Plug 'alvan/vim-closetag'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

let g:closetag_close_shortcut = '.>'

let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'

let g:Hexokinase_highlighters = [ 'backgroundfull' ]

let g:Hexokinase_refreshEvents = ["InsertLeave", "TextChanged", "BufWrite", "BufRead"]

autocmd VimEnter * HexokinaseTurnOn

"----------------------------------------------------------------------------------------------

let mapleader = " "

inoremap <C-B> <ESC>o{<return>}<ESC>ko
inoremap <C-S> <ESC>o{<return>};<ESC>ko
nnoremap <leader>c ^i//<ESC>
nnoremap <leader>u ^xx
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <leader>f zfa}
nnoremap <leader>n :set relativenumber!<return>
nnoremap <leader>sv :source $MYVIMRC<return>
nnoremap <leader>c "x
vnoremap <space> <Nop>

"----------------------------------------------------------------------------------------------

iabbrev @@ said.garcia12@gmail.com
iabbrev shb #!/bin/sh
iabbrev htdoc <!DOCTYPE html>
iabbrev && &amp;
iabbrev &< &lt;
iabbrev &> &gt;

"----------------------------------------------------------------------------------------------

autocmd BufWritePre * :%s/\s\+$//e

augroup filetype_cpp
    autocmd!
    autocmd filetype cpp :iabbrev <buffer> forg <esc>b"ndiWb"bdiWb"vdiWddOfor(int = ; > ; --)<esc>"vP2B"nPl2B"vPa <esc>l2B"bPl2B"vPa <esc>A
    autocmd filetype cpp :iabbrev <buffer> forl <esc>b"ndiWb"bdiWb"vdiWddOfor(int = ; < ; ++)<esc>"vP2B"nPl2B"vPa <esc>l2B"bPl2B"vPa <esc>A
    autocmd filetype cpp :iabbrev <buffer> forsg <esc>b"ndiWb"bdiWb"vdiWddOfor(size_t = ; > ; --)<esc>"vP2B"nPl2B"vPa <esc>l2B"bPl2B"vPa <esc>A
    autocmd filetype cpp :iabbrev <buffer> forsl <esc>b"ndiWb"bdiWb"vdiWddOfor(size_t = ; < ; ++)<esc>"vP2B"nPl2B"vPa <esc>l2B"bPl2B"vPa <esc>A
    autocmd filetype cpp :iabbrev <buffer> wt while(true)
augroup END

augroup filetype_html
    autocmd!
    autocmd filetype html :iabbrev <buffer> --- &mdash
    autocmd filetype html :setlocal  tabstop=2
    autocmd filetype html :setlocal shiftwidth=2
augroup END

augroup filetype_css
    autocmd!
    autocmd filetype css :setlocal tabstop=2
    autocmd filetype css :setlocal shiftwidth=2
augroup END

augroup web_group
    autocmd!
    autocmd BufReadPre,BufNewFile *.html,*.css,*.js :nnoremap <leader>w :call Webprev()<cr>
    autocmd BufReadPre,BufNewFile *.html,*.css,*.js :nnoremap <leader>k :call Killprev()<cr>
augroup END

"----------------------------------------------------------------------------------------------

function Webprev()
    let l:rootdir = system("ls -1 | grep index.html | wc -l")
    if l:rootdir
        let l:location = system("printf $(pwd)") . "/index.html"
    else
        let l:location = system("cd ..; printf $(pwd)") . "/index.html"
    endif

    let l:command = "surf file://localhost" . l:location . " & printf $!"
    let g:surfpid = system(l:command)

    autocmd BufWritePost *.html,*.css,*.js :call RefreshWebpage()
    autocmd ExitPre *.html,*.css,*.js :call Killprev()
endfunction

function Killprev()
    let l:command = "kill -KILL " . g:surfpid
    call system(l:command)
endfunction

function RefreshWebpage()
    let l:command = "kill -HUP " . g:surfpid
    call system(l:command)
endfunction


