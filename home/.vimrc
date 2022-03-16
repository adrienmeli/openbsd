" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set autochdir

" Redefine the leader key, default is '\'
let mapleader = ","
" Change the <LocalLeader> key:
let maplocalleader = ";"

" incremental search
set incsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" CURSOR
if &term =~ "xterm\\|rxvt"
	" use an orange cursor in insert mode
	let &t_SI = "\<Esc>]12;orange\x7"
	" use a red cursor otherwise
	let &t_EI = "\<Esc>]12;red\x7"
	let &t_SI .= "\<Esc>[4 q"
	" solid block
	let &t_EI .= "\<Esc>[1 q"
	" 1 or 0 -> blinking block
	" 3 -> blinking underscore
	" Recent versions of xterm (282 or above) also support
	" 5 -> blinking vertical bar
	" 6 -> solid vertical bar
	silent !echo -ne "\033]12;red\007"
	" reset cursor when vim exits
	autocmd VimLeave * silent !echo -ne "\033]112\007"
	" use \003]12;gray\007 for gnome-terminal
endif

" ********************** PLUGINS************
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'fxn/vim-monochrome'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" colorscheme
"let g:monochrome_italic_comments = 1
"colorscheme monochrome
set background=dark
colorscheme dracula
"set termguicolors

"lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" remappings
" Move to the next buffer
nmap gt :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap gc :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap gl :buffers<CR>:buffer<Space>

" fzf search
nmap ; :Files<CR>

" shortcuts
nnoremap ,B :e ~/github/dotfiles/openbsd/home/.bashrc<CR>
nnoremap ,X :e ~/github/dotfiles/openbsd/home/.xsession<CR>
nnoremap ,x :e ~/github/dotfiles/openbsd/home/.Xresources<CR>
nnoremap ,v :e ~/github/dotfiles/openbsd/home/.vimrc<CR>
nnoremap ,b :e ~/github/dotfiles/tex/biblio.bib<CR>
nnoremap ,s :e ~/github/dotfiles/openbsd/home/.spectrwm.conf<CR>
nnoremap ,t :e ~/.vim/ftplugin/tex.vim<CR>
nnoremap ,L :e ~/documents/linux/linux-tricks<CR>
nnoremap ,g :e ~/github/gittricks<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set runtimepath+=~/.vim/ultisnips_rep
"let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

iabbrev obj    var foo = {};<Left><Left>

" automatically set plaintex files as tex
au FileType plaintex,tex set ft=tex
