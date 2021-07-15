
vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})
-- Map <Esc> to exit terminal-mode:
vim.api.nvim_set_keymap('t', '<Esc>', "<C-\\><C-n>", {noremap = true})

vim.api.nvim_set_keymap('t', '<M-h>', '<C-\\><C-N>:TmuxNavigateLeft<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<M-j>', '<C-\\><C-N>:TmuxNavigateDown<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<M-k>', '<C-\\><C-N>:TmuxNavigateUp<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<M-l>', '<C-\\><C-N>:TmuxNavigateRight<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<M-h>', '<C-\\><C-N>:TmuxNavigateLeft<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<M-j>', '<C-\\><C-N>:TmuxNavigateDown<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<M-k>', '<C-\\><C-N>:TmuxNavigateUp<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<M-l>', '<C-\\><C-N>:TmuxNavigateRight<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-h>', ':TmuxNavigateLeft<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-j>', ':TmuxNavigateDown<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-k>', ':TmuxNavigateUp<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-l>', ':TmuxNavigateRight<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>$', ':setlocal spell! spelllang=en_us<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>q', ':Dash<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>/', ':Rg<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>t', ':Tags<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>y', ':TagbarToggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>`', ':terminal<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader><cr>', ':nohlsearch<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>.', ':e ~/.config/nvim/init.vim<CR>', {noremap=true})
