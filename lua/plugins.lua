return {
	'AndreM222/copilot-lualine',
	'CopilotC-Nvim/CopilotChat.nvim',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'hrsh7th/nvim-cmp',
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	'L3MON4D3/LuaSnip',
	'neovim/nvim-lspconfig',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {"lua", "query", "elixir", "heex", "javascript", "html", "python", "rust" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	'onsails/lspkind.nvim',
	'rmehri01/onenord.nvim',
	'saadparwaiz1/cmp_luasnip',
	{
		'stevearc/oil.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	'williamboman/mason-lspconfig.nvim',
	'williamboman/mason.nvim',
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false }
		},
		config = function(_, opts)
			require("copilot").setup(opts)
			-- HACK: work-around for https://github.com/neovim/neovim/issues/31262
			local Util = require("copilot.util")
			local language_for_file_type = Util.language_for_file_type
			Util.language_for_file_type = function(ft)
				return language_for_file_type(ft or "")
			end
		end,
	}
}
