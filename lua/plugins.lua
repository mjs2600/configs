local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'vimwiki/vimwiki'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- use 'itchyny/lightline.vim'
  use {'rizzatti/dash.vim', opt=true, cmd={'Dash'}}
  use 'machakann/vim-highlightedyank'

  use 'tpope/vim-commentary'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

  use 'edkolev/tmuxline.vim'

  use 'savq/melange'
  use 'fenetikm/falcon'
  use 'ishan9299/nvim-solarized-lua'

  use 'arcticicestudio/nord-vim'
  use 'andersevenrud/nordic.nvim'

  use 'ryanoasis/vim-devicons'
  use 'ludovicchabant/vim-gutentags'
  use 'sheerun/vim-polyglot'
  use 'JuliaEditorSupport/julia-vim'
  use 'niklasl/vim-rdf'
  use 'rvesse/vim-sparql'
  use 'gleam-lang/gleam.vim'
  use {'christoomey/vim-tmux-navigator', opt=true, cmd={'TmuxNavigateLeft', 'TmuxNavigateDown', 'TmuxNavigateUp', 'TmuxNavigateRight'}}

  use {'mbbill/undotree', opt=true, cmd={'UndotreeToggle'}}
  use {'majutsushi/tagbar', opt=true, cmd={'TagbarToggle'}}
  use {'google/vim-jsonnet', ft='jsonnet'}
  use {'neoclide/coc.nvim', branch='release'}
  -- use 'neovim/nvim-lspconfig'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use { 'fannheyward/telescope-coc.nvim',
    requires = {{'nvim-telescope/telescope.nvim'}}
  }

  use "lukas-reineke/indent-blankline.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'kristijanhusak/orgmode.nvim', config = function()
        require('orgmode').setup{
            org_agenda_files = {'~/knowledge-graph/org/**/*'},
            org_default_notes_file = '~/knowledge-graph/README.org',
        }
  end
  }

  use 'ggandor/lightspeed.nvim'
end)
