return {
	{
		-- Completion sources: copilot sits above lsp via score_offset=100.
		-- async=true ensures Copilot's network latency doesn't block the menu.
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },
			appearance = { nerd_font_variant = "mono" },
			completion = {
				menu = { draw = { treesitter = { "lsp" } } },
			},
			signature = { enabled = true },
			sources = {
				default = { "copilot", "lsp", "path", "snippets", "buffer" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
