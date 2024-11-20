return {
	'AndreM222/copilot-lualine',
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			window = {
				layout = 'float',
				relative = 'editor',
				border = 'rounded',
				width = 1,
				height = 0.2,
				row = vim.o.lines
			}
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/notes/personal",
				},
				{
					name = "work",
					path = "~/notes/work",
				},
			},

		},
	},
	{
		"epwalsh/pomo.nvim",
		version = "*", -- Recommended, use latest release instead of latest commit
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
		dependencies = {
			-- Optional, but highly recommended if you want to use the "Default" timer
			"rcarriga/nvim-notify",
		},
		opts = {
			-- See below for full list of options 👇
			-- How often the notifiers are updated.
			update_interval = 1000,

			-- Configure the default notifiers to use for each timer.
			-- You can also configure different notifiers for timers given specific names, see
			-- the 'timers' field below.
			notifiers = {
				-- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
				{
					name = "Default",
					opts = {
						-- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
						-- continuously displayed. If you only want a pop-up notification when the timer starts
						-- and finishes, set this to false.
						sticky = true,

						-- Configure the display icons:
						title_icon = "󱎫",
						text_icon = "󰄉",
						-- Replace the above with these if you don't have a patched font:
						-- title_icon = "⏳",
						-- text_icon = "⏱️",
					},
				},

				-- The "System" notifier sends a system notification when the timer is finished.
				-- Available on MacOS and Windows natively and on Linux via the `libnotify-bin` package.
				{ name = "System" },

				-- You can also define custom notifiers by providing an "init" function instead of a name.
				-- See "Defining custom notifiers" below for an example 👇
				-- { init = function(timer) ... end }
			},

			-- Override the notifiers for specific timer names.
			timers = {
				-- For example, use only the "System" notifier when you create a timer called "Break",
				-- e.g. ':TimerStart 2m Break'.
				Break = {
					{ name = "System" },
				},
			},
			-- You can optionally define custom timer sessions.
			sessions = {
				-- Example session configuration for a session called "pomodoro".
				pomodoro = {
					{ name = "Work",        duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work",        duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work",        duration = "25m" },
					{ name = "Long Break",  duration = "15m" },
				},
			},
		},
	},
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
		-- tag = '0.1.8',
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
				ensure_installed = { "lua", "query", "elixir", "heex", "javascript", "html", "python", "rust" },
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
