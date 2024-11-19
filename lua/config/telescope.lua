local telescope = require('telescope')

telescope.setup()
telescope.load_extension('fzf')



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>s', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope LSP symbols' })
vim.keymap.set('n', '<leader>t', builtin.treesitter, { desc = 'Telescope treesitter' })

