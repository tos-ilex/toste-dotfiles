set number
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

nnoremap <C-d> :tabn<CR>
nnoremap <C-a> :tabp<CR>
nnoremap <C-k><C-w> :tabo<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-c> "+y<CR>

" run NERDTree with vim
autocmd VimEnter * NERDTree | wincmd p

" close vim if last remaining tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" show line numbers for NERDtree tab
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal number

" vim plug
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'lambdalisue/suda.vim'
call plug#end()

