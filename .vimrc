" Automatically install vimplug if it isn't already
" ------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
" ------------------------------------------------

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

"Make vim clipboard the same as ubuntu's ( note this requires +clipboard to
"show when you type vim --version
"set clipboard=unnamedplus

" Underline the current line with either dashes or equals. Underlines up to
" the length.
nnoremap <F4> yyp<c-v>$r-
nnoremap <F5> yyp<c-v>$r=

" Automatically turn on set paste mode copying and pasting from terminal
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"Make search case insensitive
set ignorecase

"Set hybrid line numbering
set number relativenumber

"Set fileformat=unix

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai

" Disable EX and command mode (I never use it)
nnoremap Q <Nop>
nnoremap q: <nop>

" Hghlight words that are being searched for in real time as you type
set incsearch
" Don't hightlight everything else - just the next thing
" set nohlsearch
" Toggle on highlight everything with <C-A>.
noremap <c-a> :set hlsearch!<cr>

set ruler

" Turn off underscore error highlighting for markdown because vim is stupid
:hi link markdownError Normal

" Set the background to dark for xterm
set background=dark

":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" Move between splits with control and vim arrows
" From: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
" control W R, swap planes 
" "Max out the height of the current split
"ctrl + w _

"Max out the width of the current split
"ctrl + w |

"Normalize all split sizes, which is very handy when resizing terminal
" ctrl + w =
" more natural split opening
set splitbelow
set splitright

" use system clipboard
" https://anuragpeshne.github.io/essays/vim/7.html
"noremap y "*y
"noremap yy "*yy
"noremap Y "*y$
"noremap x "*x
"noremap dd "*dd
"noremap D "*D
