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
vnoremap <leader>p "_dP

" run NERDTree with vim
autocmd VimEnter * NERDTree | wincmd p

" close vim if last remaining tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" show line numbers for NERDtree tab
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal number

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

:let g:NERDTreeWinSize=50

" vim plug
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'lambdalisue/suda.vim'
  Plug 'pangloss/vim-javascript'    " JavaScript support
  " Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
call plug#end()
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" CoC settings
set updatetime=300
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nmap <C-P> :FZF<CR>
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:ackprg = 'ag --nogroup --nocolor --column'
