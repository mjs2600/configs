vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>c", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>.", ":e ~/.config/nvim/init.lua<cr>",
	{ noremap = true, desc = "Open the Neovim config file" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader><leader>', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope LSP symbols' })
vim.keymap.set('n', '<leader>:', builtin.treesitter, { desc = 'Telescope treesitter' })
