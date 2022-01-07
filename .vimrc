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
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'kamykn/spelunker.vim'
call plug#end()

" Spelling options
"----------------
let g:spelunker_disable_uri_checking = 1

" Whitespace highlighting
"------------------------
"Enable whitespace highlighting
" :EnableWhitespace
"Strip whitespace errors on save
autocmd FileType md,go,txt,sh EnableStripWhitespaceOnSave
let g:better_whitespace_enabled=1
" enable for all file types except the blacklist
let g:strip_whitespace_on_save=1
"Need to expressly remove markdown from the filelist to get md files to work
let g:better_whitespace_filetypes_blacklist=['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'fugitive']

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
set smartindent

set scrolloff=2
" Add extra column to left to show linting or git integration
set signcolumn=yes

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

" Map control y and control P to yank and paste to clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Show statusbar
" Possibly for future will use https://github.com/tomasiser/vim-code-dark
set laststatus=2
function! GitBranch()
  silent let ret = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return ret
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

set statusline=%#StatusBarGitBranch#
set statusline+=\ %{StatuslineGit()}
"Filename
set statusline+=\ \ %#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=

set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
"set statusline+=%#CursorColumn#
set statusline+=\ %#PmenuSel#
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

" Convert snake_case to camelCase
nnoremap <leader>c :%s/_\(\w\)/\U\1

" Underline the current line with either dashes or equals. Underlines up to
" the length.
nnoremap <leader>- yyp<c-v>$r-
nnoremap <leader>= yyp<c-v>$r=
nnoremap <leader>n :set list!<CR>

" automatically create .sh shebang and set +x
" Added from
" https://github.com/LinuxSDA/HashBang/blob/master/Hashbang
" ==========================================================================
function! Hashbang(portable, permission, RemExt)
let shells = {
        \    'awk': "awk",
        \     'sh': "bash",
        \     'hs': "runhaskell",
        \     'jl': "julia",
        \    'lua': "lua",
        \    'mak': "make",
        \     'js': "node",
        \      'm': "octave",
        \     'pl': "perl",
        \    'php': "php",
        \     'py': "python",
        \      'r': "Rscript",
        \     'rb': "ruby",
        \  'scala': "scala",
        \    'tcl': "tclsh",
        \     'tk': "wish"
        \    }

let extension = expand("%:e")

if has_key(shells,extension)
	let fileshell = shells[extension]

	if a:portable
		let line =  "#! /usr/bin/env " . fileshell
	else
		let line = "#! " . system("which " . fileshell)
	endif

	0put = line

	if a:permission
		:autocmd BufWritePost * :autocmd VimLeave * :!chmod u+x %
	endif


	if a:RemExt
		:autocmd BufWritePost * :autocmd VimLeave * :!mv % "%:p:r"
	endif

endif

endfunction

:autocmd BufNewFile *.* :call Hashbang(1,1,0)
" ==========================================================================
