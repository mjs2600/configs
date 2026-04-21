-- Load eagerly with high priority so other plugins see the colorscheme
-- when they initialize. Applying `colorscheme` here (instead of init.lua)
-- keeps everything related to this theme in one place.
return {
	"rmehri01/onenord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onenord").setup({})
		vim.cmd.colorscheme("onenord")
	end,
}
