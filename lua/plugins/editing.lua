return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		opts = {
			keybindings = {
				left = "<M-h>",
				down = "<M-j>",
				up = "<M-k>",
				right = "<M-l>",
			},
		},
		config = function(_, opts)
			require("nvim-tmux-navigation").setup(opts)
		end,
	},
	{ "NoahTheDuke/vim-just", ft = "just" },
}
