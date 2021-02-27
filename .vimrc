call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

"Set hybrid line numbering
set number relativenumber
set nu rnu

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai

" highlight all search
set hlsearch

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

" use system clipboard
" https://anuragpeshne.github.io/essays/vim/7.html
"noremap y "*y
"noremap yy "*yy
"noremap Y "*y$
"noremap x "*x
"noremap dd "*dd
"noremap D "*D
