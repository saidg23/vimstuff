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

Plug 'tpope/vim-surround'

call plug#end()

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
nnoremap <leader>ev :vsplit $MYVIMRC<return>
nnoremap <leader>sv :source $MYVIMRC<return>

"----------------------------------------------------------------------------------------------

iabbrev @@ said.garcia12@gmail.com

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
augroup END

augroup web_group
    autocmd!
    autocmd BufReadPre,BufNewFile *.html,*.css,*.js :nnoremap <leader>w :call Webprev()<cr>
    autocmd BufReadPre,BufNewFile *.html,*.css,*.js :nnoremap <leader>k :call Killprev()<cr>
    autocmd BufWritePost *.html,*.css,*.js :call RefreshWebpage()
    autocmd ExitPre *.html,*.css,*.js :call Killprev()
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
endfunction

function Killprev()
    let l:command = "kill -KILL " . g:surfpid
    call system(l:command)
endfunction

function RefreshWebpage()
    let l:command = "kill -HUP " . g:surfpid
    call system(l:command)
endfunction


