-- Only non-default options are set here; everything else uses lualine's
-- defaults. `copilot` in lualine_x is provided by the copilot-lualine
-- dependency listed in lua/plugins/lualine.lua.
require("lualine").setup({
	options = {
		theme = 'nord',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_b = {
			'branch',
			'diff',
			{
				'diagnostics',
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
			},
		},
		lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
	},
})
