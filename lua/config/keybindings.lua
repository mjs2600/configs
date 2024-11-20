vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>c", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>.", ":e ~/.config/nvim/init.lua<cr>",
	{ noremap = true, desc = "Open the Neovim config file" })
