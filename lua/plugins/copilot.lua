return {
	{
		-- Backend only: suggestion/panel UIs are disabled because blink.cmp
		-- (see lua/plugins/completion.lua) consumes Copilot via blink-copilot
		-- and renders suggestions in the regular completion menu.
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
		keys = {
			{ "<leader>as", "<CMD>Copilot status<CR>",  desc = "Copilot status" },
			{ "<leader>aA", "<CMD>Copilot auth<CR>",    desc = "Copilot auth" },
			{ "<leader>aD", "<CMD>Copilot disable<CR>", desc = "Copilot disable" },
			{ "<leader>aE", "<CMD>Copilot enable<CR>",  desc = "Copilot enable" },
		},
	},
	{
		-- <leader>a* = "AI" keymap group. Keymaps are declared here so lazy.nvim
		-- loads the plugin on first keypress; the `cmd` list covers direct
		-- `:CopilotChat*` invocations.
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		cmd = {
			"CopilotChat",
			"CopilotChatToggle",
			"CopilotChatExplain",
			"CopilotChatReview",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatTests",
			"CopilotChatCommit",
			"CopilotChatModels",
			"CopilotChatReset",
		},
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		build = "make tiktoken",
		opts = {
			window = {
				layout = "float",
				relative = "editor",
				border = "rounded",
				width = 1,
				height = 0.2,
				row = vim.o.lines,
			},
		},
		keys = {
			{ "<leader>aa", "<CMD>CopilotChatToggle<CR>",   desc = "Copilot Chat: toggle",         mode = { "n", "v" } },
			{ "<leader>ar", "<CMD>CopilotChatReset<CR>",    desc = "Copilot Chat: reset" },
			{ "<leader>am", "<CMD>CopilotChatModels<CR>",   desc = "Copilot Chat: pick model" },
			{ "<leader>ae", "<CMD>CopilotChatExplain<CR>",  desc = "Copilot Chat: explain code",   mode = { "n", "v" } },
			{ "<leader>aR", "<CMD>CopilotChatReview<CR>",   desc = "Copilot Chat: review code",    mode = { "n", "v" } },
			{ "<leader>af", "<CMD>CopilotChatFix<CR>",      desc = "Copilot Chat: fix code",       mode = { "n", "v" } },
			{ "<leader>ao", "<CMD>CopilotChatOptimize<CR>", desc = "Copilot Chat: optimize code",  mode = { "n", "v" } },
			{ "<leader>ad", "<CMD>CopilotChatDocs<CR>",     desc = "Copilot Chat: add docs",       mode = { "n", "v" } },
			{ "<leader>at", "<CMD>CopilotChatTests<CR>",    desc = "Copilot Chat: generate tests", mode = { "n", "v" } },
			{ "<leader>ac", "<CMD>CopilotChatCommit<CR>",   desc = "Copilot Chat: commit message" },
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end,
				desc = "Copilot Chat: quick ask",
			},
		},
	},
}
