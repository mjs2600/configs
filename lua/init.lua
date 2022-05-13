local fennel = require('fennel')
table.insert(package.loaders or package.searchers, fennel.searcher)

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('plugins')
require('plugins-load')

require('display')
require('wiki')
require('coc-config')
require('tree-sitter-config')
require('keybindings')
