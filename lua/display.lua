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
vim.o.grepprg = "rg"
vim.g.termguicolors = true
vim.o.termguicolors = true
vim.g.falcon_background = 0
vim.g.falcon_inactive = 1


vim.cmd [[colorscheme nord]]

vim.g.nord_contrast = true
vim.g.nord_borders = true

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
