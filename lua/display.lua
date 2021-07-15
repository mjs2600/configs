vim.o.hidden = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.inccommand = "nosplit"
vim.o.number = true
vim.o.listchars = "tab:>>,eol:¬,trail:·"
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.o.shell = "fish"
vim.o.mouse = "a"
vim.o.vb = true
vim.o.clipboard = "unnamedplus"
vim.o.textwidth = 0
vim.o.colorcolumn = "+1"
vim.o.grepprg = "rg"
vim.o.background = "dark"


vim.g.onedark_termcolors = 256

vim.cmd "colorscheme liquidcarbon"

vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'minimalist'
