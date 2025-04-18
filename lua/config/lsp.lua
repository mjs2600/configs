-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		["lua_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			}
		end,
		["nextls"] = function()
			require("lspconfig").nextls.setup({
				cmd = { "nextls", "--stdio" },
				init_options = {
					extensions = {
						credo = { enable = true }
					},
					experimental = {
						completions = { enable = true }
					}
				}
			})
		end,
	},
	ensure_installed = {
		"awk_ls",
		"bashls",
		"lua_ls",
		"nextls",
		"pyright",
		"ruff",
		"rust_analyzer",
		"vale_ls",
	},
})

-- Format the buffer before saving it
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		local filetype = vim.bo.filetype
		if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
			vim.cmd('lua vim.lsp.buf.format()')
		else
		end
	end
})
