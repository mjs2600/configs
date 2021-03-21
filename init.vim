if !filereadable(glob("~/.config/nvim/autoload/plug.vim"))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

" let g:python_host_prog = $HOME . '/nvim2/bin/python'
" let g:ruby_host_prog = $HOME . '/.asdf/installs/ruby/2.5.1/bin/ruby'
" let g:python3_host_prog = $HOME . '/nvim3/bin/python'
let g:python3_host_prog = $HOME . '/.asdf/installs/python/3.9.0/bin/python'


let mapleader = ' '
let maplocalleader = ','
" let g:ale_completion_enabled = 1

silent !mkdir -p ~/.vim/undo > /dev/null 2>&1

call plug#begin('~/.vim/plugged')
" Plug 'dense-analysis/ale'
" Plug 'elmcast/elm-vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'leanprover/lean.vim'
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'chrisbra/csv.vim'

" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'
" Plug 'manicmaniac/coconut.vim'

" Plug 'maralla/completor.vim'
" Plug 'thinca/vim-ref'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'ervandew/supertab'
" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'machakann/vim-highlightedyank'
" Plug 'guns/vim-sexp'
" Plug 'kien/rainbow_parentheses.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'edkolev/tmuxline.vim'
" Plug 'nanotech/jellybeans.vim'
" Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/Liquid-Carbon'

Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'

" Plug 'jmcantrell/vim-virtualenv'

Plug 'sheerun/vim-polyglot'
Plug 'google/vim-jsonnet', {'for': 'jsonnet'}
Plug 'christoomey/vim-tmux-navigator', { 'on': ['TmuxNavigateLeft', 'TmuxNavigateDown', 'TmuxNavigateUp', 'TmuxNavigateRight'] }
Plug 'niklasl/vim-rdf'
Plug 'rvesse/vim-sparql'
call plug#end()

syntax enable
filetype plugin indent on
filetype detect
" let g:jellybeans_background_color_256='NONE'
" colorscheme onedark
" set background=light
set background=dark
" colorscheme solarized
let g:onedark_termcolors=256
colorscheme liquidcarbon

" nnoremap <silent> K :ALEHover<CR>
" nnoremap <silent> <cr> :ALEHover<cr>
" " nnoremap <silent> gd :ALEGoToDefinition<CR>
" nnoremap <silent> gf :ALEFix<cr>
" nnoremap <silent> <leader>s :ALESymbolSearch
" nnoremap <silent> <leader>r :ALEFindReferences<cr>
" Remap keys for gotos

set expandtab
set shiftwidth=2
set softtabstop=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set inccommand=nosplit
set number
" set encoding=utf8 " Necessary to show Unicode glyphs
set list listchars=tab:>>,eol:¬,trail:·
set undofile
set undodir=~/.vim/undo
set shell=fish
set mouse=a
set vb
set guioptions-=T  "remove toolbar
set clipboard+=unnamedplus
set textwidth=0
set colorcolumn=+1
set t_Co=256
set grepprg=rg\ --vimgrep

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)


nnoremap Y y$

" Map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>
" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l


let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
" nnoremap <silent> <Down> :TmuxNavigateDown<cr>
" nnoremap <silent> <Up> :TmuxNavigateUp<cr>
" nnoremap <silent> <Right> :TmuxNavigateRight<cr>
tnoremap <silent> <M-h> <C-\><C-N>:TmuxNavigateLeft<cr>
tnoremap <silent> <M-j> <C-\><C-N>:TmuxNavigateDown<cr>
tnoremap <silent> <M-k> <C-\><C-N>:TmuxNavigateUp<cr>
tnoremap <silent> <M-l> <C-\><C-N>:TmuxNavigateRight<cr>
inoremap <silent> <M-h> <C-\><C-N>:TmuxNavigateLeft<cr>
inoremap <silent> <M-j> <C-\><C-N>:TmuxNavigateDown<cr>
inoremap <silent> <M-k> <C-\><C-N>:TmuxNavigateUp<cr>
inoremap <silent> <M-l> <C-\><C-N>:TmuxNavigateRight<cr>
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>


" noremap <silent> <c-l> <c-w>l
" noremap <silent> <c-h> <c-w>h
" noremap <silent> <c-k> <c-w>k
" noremap <silent> <c-j> <c-w>j
"
noremap <leader>$ :setlocal spell! spelllang=en_us<CR>
noremap <leader>f :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>q :Dash<CR>
noremap <leader>/ :Rg<CR>
noremap <leader>t :Tags<CR>
noremap <leader>y :TagbarToggle<CR>
noremap <leader>u :UndotreeToggle<CR>
noremap <leader>` :terminal<CR>

nnoremap <leader><cr> :nohlsearch<cr>

func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc
augroup whitespace
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END

let g:vimwiki_list = [{'path': '~/Dropbox/knowledge-graph',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

autocmd BufEnter *.wiki silent! lcd %:p:h
autocmd FileType vimwiki :nmap <Leader>tt <Plug>VimwikiToggleListItem
autocmd FileType vimwiki :vmap <Leader>tt <Plug>VimwikiToggleListItem


noremap <leader>. :e ~/.config/nvim/init.vim<CR>

" Make
autocmd FileType make setlocal noexpandtab softtabstop=0

" Elixir
autocmd FileType elixir noremap <buffer> <leader><space> :!mix test<cr>
autocmd FileType elixir noremap <buffer> <leader>~ :!mix dialyzer<cr>
augroup filetypedetect
  au BufRead,BufNewFile *.exs set filetype=elixir
  au BufRead,BufNewFile *.exs,*.ex set textwidth=98
augroup END

" Rust
autocmd FileType rust noremap <buffer> <leader><space> :!cargo test<cr>

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

" Markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }

" let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_cache_dir = '~/.tags_cache'
set statusline+=%{gutentags#statusline()}

" let g:polyglot_disabled = ['elm', 'r']

let g:LatexBox_latexmk_async = 1
" let g:LatexBox_latexmk_preview_continuously = 1

" Theme
let g:airline_powerline_fonts = 1
" let g:airline_theme='onedark'
let g:airline_theme='minimalist'
" let g:airline_solarized_bg='dark'
" let g:airline#extensions#ale#enabled = 1
"
" " if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <m-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-rust-analyzer',
      \ 'coc-pyright',
      \ 'coc-toml',
      \ 'coc-markdownlint',
      \ 'coc-emoji',
      \ 'coc-sh',
      \ 'coc-fish'
      \ ]

augroup formatting
  autocmd BufWrite * silent call CocAction('format')
augroup END
