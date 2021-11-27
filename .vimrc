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

" Set Y to copy to end of line (be like A, D, C)
nnoremap Y y$

" Override non printable characters for set list
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Make vim work in the same was as tmux for moving windows it's the opposite
" corner on my moonlander keyboard
nnoremap \ <c-w>

" Keep searching centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Make undo points on common programming characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Put any big jumps into jump list
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'



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

" Set no bells
set noerrorbells
"Set fileformat=unix

" Turn off swap files and put undo files in .vim directory
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai

" Set a bar to indicate how wide code is
"set colorcolumn=80

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

" Show statusbar
" Possibly for future will use https://github.com/tomasiser/vim-code-dark
set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" Setup statusbar colors
hi StatusBarGitBranch guifg=White guibg=DarkSlateGray ctermbg=17 ctermfg=White
"hi StatusBarFileName guifg=Black guibg=Green ctermbg=46 ctermfg=0
"hi StatusBarFileStatus guifg=Black guibg=Green ctermbg=46 ctermfg=0
hi StatusBarPosition guifg=Black guibg=Green ctermbg=17 ctermfg=White

set statusline=
set statusline+=%#StatusBarGitBranch#
set statusline+=\ 
set statusline+=%{StatuslineGit()}
set statusline+=\ 
set statusline+=\ 
"Filename
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=

au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
" default the statusline when entering Vim
hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15

set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]      
set statusline+=\ 
"set statusline+=%#CursorColumn#
set statusline+=%#PmenuSel#
set statusline+=%#StatusBarPosition#
set statusline+=%r      "read only flag
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n\                    " Buffer number
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]

"Allow commands to be run by typing <space><char>
let mapleader = " "

" Capital J and K move the selection up and down, control j and k in insert
" move the line and leader j,k in normal mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <c-j> <esc>:m .+1<CR>==
inoremap <c-k> <esc>:m .-2<CR>==
nnoremap <leader>j <esc>:m .+1<CR>==
nnoremap <leader>k <esc>:m .-2<CR>==

" Underline the current line with either dashes or equals. Underlines up to
" the length.
nnoremap <leader>- yyp<c-v>$r-
nnoremap <leader>= yyp<c-v>$r=
