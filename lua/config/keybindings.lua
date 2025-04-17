vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>c", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>.", ":e ~/.config/nvim/init.lua<cr>",
	{ noremap = true, desc = "Open the Neovim config file" })

vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting
