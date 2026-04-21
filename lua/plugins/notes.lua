return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			workspaces = {
				{ name = "personal", path = "~/notes/personal" },
				{ name = "work",     path = "~/notes/work" },
			},
		},
	},
	{
		"epwalsh/pomo.nvim",
		version = "*",
		cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
		dependencies = { "rcarriga/nvim-notify" },
		opts = {
			update_interval = 1000,
			notifiers = {
				{
					name = "Default",
					opts = {
						sticky = true,
						title_icon = "󱎫",
						text_icon = "󰄉",
					},
				},
				{ name = "System" },
			},
			timers = {
				Break = { { name = "System" } },
			},
			sessions = {
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
}
