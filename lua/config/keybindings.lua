-- Editor options
vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting
vim.o.expandtab = true -- Pressing TAB inserts spaces

-- Global keymaps. Plugin-specific keymaps live with their plugin specs
-- under lua/plugins/ so lazy.nvim can lazy-load on keypress.
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>.", "<CMD>edit $MYVIMRC<CR>", { desc = "Open Neovim config" })
