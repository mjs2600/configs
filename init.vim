if !filereadable(glob("~/.config/nvim/autoload/plug.vim"))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

let mapleader = ' '

silent !mkdir -p ~/.vim/undo > /dev/null 2>&1

call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'elmcast/elm-vim'
Plug 'vimwiki/vimwiki'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leanprover/lean.vim'
Plug 'rizzatti/dash.vim'
Plug 'reasonml-editor/vim-reason-plus'

" Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Plug 'maralla/completor.vim'
" Plug 'thinca/vim-ref'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'ervandew/supertab'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

Plug 'edkolev/tmuxline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'jmcantrell/vim-virtualenv'

Plug 'sheerun/vim-polyglot'
call plug#end()

set expandtab
set shiftwidth=2
set softtabstop=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set inccommand=nosplit
set number
set encoding=utf-8 " Necessary to show Unicode glyphs
set list listchars=tab:>>,eol:¬,trail:·
set undofile
set undodir=~/.vim/undo
set shell=zsh
set mouse=a
set vb
set guioptions-=T  "remove toolbar
set clipboard+=unnamedplus
set textwidth=80
set colorcolumn=+1
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)


nnoremap Y y$

noremap <silent> <Right> <c-w>l
noremap <silent> <Left> <c-w>h
noremap <silent> <Up> <c-w>k
noremap <silent> <Down> <c-w>j

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Up> :TmuxNavigateUp<cr>
nnoremap <silent> <Right> :TmuxNavigateRight<cr>

" noremap <silent> <c-l> <c-w>l
" noremap <silent> <c-h> <c-w>h
" noremap <silent> <c-k> <c-w>k
" noremap <silent> <c-j> <c-w>j

noremap <leader>$ :setlocal spell! spelllang=en_us<CR>
noremap <leader>f :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>q :Dash<CR>
noremap <leader>/ :Ag<CR>
noremap <leader>t :Tags<CR>
noremap <leader>y :TagbarToggle<CR>
noremap <leader>u :UndotreeToggle<CR>

nnoremap <leader><cr> :nohlsearch<cr>

func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc
augroup whitespace
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

syntax enable
filetype plugin indent on

noremap <leader>. :e ~/.config/nvim/init.vim<CR>


"Elixir
autocmd FileType elixir noremap <buffer> <leader>` :!mix test<cr>
autocmd FileType elixir noremap <buffer> <leader>~ :!mix dialyzer<cr>
augroup filetypedetect
  au BufRead,BufNewFile *.exs set filetype=elixir
  au BufRead,BufNewFile *.exs,*.ex set textwidth=80
augroup END
augroup END

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'm:modules',
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

" Rust
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types',
        \'f:functions',
        \'g:enums',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts',
        \'t:traits',
        \'i:impls',
    \]
    \}

" Haskell
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
"Elm
let g:elm_format_autosave = 1
" Auto Formatting

" Formatting
" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre *.json Neoformat
" autocmd BufWritePre *.rs Neoformat

" Markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }

let g:ale_virtualenv_dir_names = ['.env', 'env', 've', 've-py3', 'virtualenv', '.direnv/python-2.7.13', '.direnv/python-3.6.1']
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:gutentags_cache_dir = '~/.tags_cache'
set statusline+=%{gutentags#statusline()}

let g:polyglot_disabled = ['elm', 'r']

" Theme
let g:airline_powerline_fonts = 1

let g:jellybeans_background_color_256='NONE'
colorscheme jellybeans

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
