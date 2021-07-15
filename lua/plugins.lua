return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'vimwiki/vimwiki'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {'rizzatti/dash.vim', opt=true, cmd={'Dash'}}
  use 'machakann/vim-highlightedyank'

  use 'tpope/vim-commentary'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

  use 'edkolev/tmuxline.vim'
  use 'vim-scripts/Liquid-Carbon'
  use 'ryanoasis/vim-devicons'
  use 'ludovicchabant/vim-gutentags'
  use 'sheerun/vim-polyglot'
  use 'niklasl/vim-rdf'
  use 'rvesse/vim-sparql'
  use 'gleam-lang/gleam.vim'
  use {'christoomey/vim-tmux-navigator', opt=true, cmd={'TmuxNavigateLeft', 'TmuxNavigateDown', 'TmuxNavigateUp', 'TmuxNavigateRight'}}

  use {'mbbill/undotree', opt=true, cmd={'UndotreeToggle'}}
  use {'majutsushi/tagbar', opt=true, cmd={'TagbarToggle'}}
  use {'google/vim-jsonnet', ft='jsonnet'}
  use {'neoclide/coc.nvim', branch='release'}
  -- use 'neovim/nvim-lspconfig'

  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
end)
